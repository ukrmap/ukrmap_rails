module Nokogiri
  module XML
    class Document
      def get(*args)
        at(*args).try(:text)
      end
    end
  end
end

ActiveRecord::Base.connection.execute("TRUNCATE entries;")

elements = ::Nokogiri::XML::Reader(File.open(Rails.root.join("db", "entries.xml"))).map do |node|
  next unless node.name == "entry" && node.node_type == Nokogiri::XML::Reader::TYPE_ELEMENT
  element = ::Nokogiri::XML(node.outer_xml)
  e = Entry.new
  e.id = element.get("id")
  e.category = element.get("category")
  e.course = element.get("course")
  e.parent_id = element.get("parent_id").to_i
  e.level = element.get("level").to_i
  e.dir2 = element.get("dir2")
  e.tutorial = element.get("tutorial")
  e.title_ru = element.get("title_ru")
  e.title_uk = element.get("title_uk")
  e.title_en = element.get("title_en")
  e.title_be = element.get("title_be")
  e.dir = element.get("dir")
  e.text_file = element.get("text_file")
  e.maps = element.get("maps").to_s.split(";")
  e.maps_names_ru = element.get("maps_names_ru").to_s.split(";")
  e.maps_names_uk = element.get("maps_names_uk").to_s.split(";")
  e.maps_names_en = element.get("maps_names_en").to_s.split(";")
  e.maps_names_be = element.get("maps_names_be").to_s.split(";")
  e.legend = element.get("legend").to_s.split(";").map(&:presence)
  e.legends = element.get("legends").to_s.split(";").map(&:presence)
  e.pictures = element.get("pictures").to_s.split(";")
  e.video_file = element.get("video_file")
  e.xmlfile = element.get("xmlfile")
  e.text_with_title = true if element.get("text_with_title")
  e.sequence = element.get("sequence").to_i
  e.save
end
