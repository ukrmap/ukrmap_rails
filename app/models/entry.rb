class Entry < ApplicationRecord
  belongs_to :parent, class_name: 'Entry', foreign_key: 'parent_id', required: false

  def title
    read_attribute(:"title_#{I18n.locale}")
  end

  def content
    return unless text_file?
    t = Rails.root.join('content', 'pages', dir2, "#{text_file}_#{I18n.locale}.htm")
    if File.exist? t
      File.open(t).read
    else
      File.open(Rails.root.join('content', 'pages', dir2, "#{text_file}.htm")).read
    end
  end

  def map_files_with_names
    maps_list.zip(map_names).map do |map, name|
      next unless map
      f = Rails.root.join('public', 'images', files_dir, 'Maps', "#{map}.jpg")
      next unless File.exist?(f)
      w, h = Dimensions.dimensions(f)
      p = File.join("/images/#{files_dir}", 'Maps', map)
      ["#{p}.jpg", w, h, "#{p}_resize.jpg", name]
    end.compact
  end

  def maps_list
    maps.to_s.split(';')
  end

  def map_names
    __send__(:"maps_names_#{I18n.locale}").to_s.split(';')
  end

  def pictures_files_with_names
    pictures_list.reduce([]) do |acc, pictures_dir|
      b = Rails.root.join('content', 'pictures', files_dir, pictures_dir)
      f = File.exist?("#{b}_#{I18n.locale}.xml") ? "#{b}_#{I18n.locale}.xml" : "#{b}.xml"
      doc = Nokogiri::XML(File.open(Rails.root.join(f)).read)
      doc.xpath('//Item').each do |item|
        fname = item[:FileName]
        thumbnail_path = Rails.root.join('public', 'images', files_dir, pictures_dir, "#{fname}_resize.jpg")
        next unless File.exist?(thumbnail_path)
        picture_path = Rails.root.join('public', 'images', files_dir, pictures_dir, "#{fname}.jpg")
        w, h = Dimensions.dimensions(picture_path)
        base = File.join("/images/#{files_dir}", pictures_dir)
        picture = File.join(base, "#{fname}.jpg")
        thumbnail = File.join(base, "#{fname}_resize.jpg")
        acc << [picture, w, h, thumbnail, item[:Caption]]
      end
      acc
    end
  end

  def pictures_list
    pictures.to_s.split(';')
  end

  def testing
    @testing ||= Testing.new(self)
  end

  def files_dir
    case dir2
      when 'wh6b' then 'wh6a'
      when 'wh11b' then 'wh11a'
      else dir2
    end
  end

  def previous_entry
    Entry.where(course: course, level: 3).where(Entry.arel_table[:sequence].lt(sequence)).last
  end

  def next_entry
    Entry.where(course: course, level: 3).where(Entry.arel_table[:sequence].gt(sequence)).first
  end
end
