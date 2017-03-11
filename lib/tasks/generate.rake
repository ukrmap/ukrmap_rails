namespace :generate do
  desc "Generate file public/sitemap.xml"
  task sitemap: :environment do
    builder = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
      xml.urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9") do
        xml.url {
          xml.loc "http://ukrmap.su/"
        }
        Entry.where(level: 2).each do |entry|
          xml.url {
            xml.loc "http://ukrmap.su/uk-#{entry.course}"
          }
          xml.url {
            xml.loc "http://ukrmap.su/ru-#{entry.course}"
          }
          xml.url {
            xml.loc "http://ukrmap.su/en-#{entry.course}"
          }
          xml.url {
            xml.loc "http://ukrmap.su/be-#{entry.course}"
          }
        end
        Entry.where(level: 3).each do |entry|
          xml.url {
            xml.loc "http://ukrmap.su/uk-#{entry.course}/#{entry.id}.html"
          }
          xml.url {
            xml.loc "http://ukrmap.su/ru-#{entry.course}/#{entry.id}.html"
          }
          xml.url {
            xml.loc "http://ukrmap.su/en-#{entry.course}/#{entry.id}.html"
          }
          xml.url {
            xml.loc "http://ukrmap.su/be-#{entry.course}/#{entry.id}.html"
          }
        end
      end
    end
    File.open(Rails.root.join('public', 'sitemap.xml'), 'w').write(builder.to_xml)
  end

  desc "Generate seed data file db/entries.xml"
  task entries: :environment do
    builder = Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
      xml.ukrmap do
        Entry.order(:id).each do |e|
          xml.entry {
            xml.id e.id
            xml.category e.category if e.category?
            xml.course e.course if e.course?
            xml.parent_id e.parent_id if e.parent_id?
            xml.level e.level
            xml.dir2 e.dir2 if e.dir2?
            xml.tutorial e.tutorial if e.tutorial?
            xml.title_ru e.title_ru
            xml.title_uk e.title_uk
            xml.title_en e.title_en
            xml.title_be e.title_be
            xml.dir e.dir if e.dir?
            xml.text_file e.text_file if e.text_file?
            xml.maps e.maps.join(";") if e.maps?
            xml.maps_names_ru e.maps_names_ru.join(";") if e.maps_names_ru?
            xml.maps_names_uk e.maps_names_uk.join(";") if e.maps_names_uk?
            xml.maps_names_en e.maps_names_en.join(";") if e.maps_names_en?
            xml.maps_names_be e.maps_names_be.join(";") if e.maps_names_be?
            xml.legend e.legend.join(";") if e.legend?
            xml.legends e.legends.join(";") if e.legends?
            xml.pictures e.pictures.join(";") if e.pictures?
            xml.video_file e.video_file if e.video_file?
            xml.xmlfile e.xmlfile if e.xmlfile?
            xml.text_with_title e.text_with_title if e.text_with_title?
            xml.sequence e.sequence
          }
        end
      end
    end
    File.open(Rails.root.join('db', 'entries.xml'), 'w').write(builder.to_xml)
  end
end
