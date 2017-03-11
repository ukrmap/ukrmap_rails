class Testing
  LETTERS = %w(a b c d e f g h i j k l m n o p)

  def initialize(entry)
    @entry = entry
  end

  def name
    testing[:name]
  end

  def questions
    @questions ||= testing.children.select {|ch| ch.name == 'question' }
  end

  def self.correct_answers(question)
    answers = question.children.select {|ch| ch.name == 'answer' }
    if question[:simple] == 'False'
      question.children.find {|ch| ch.name == 'variant' }.children.select(&:element?).each_with_index.reduce([]) do |acc, (item, i)|
        if (answer_num = item[:flag].to_i) > 0
          acc << [answer_num, LETTERS[i]]
        end
        acc
      end.sort_by(&:first).map {|a, v| "#{a} - #{v}" }.join(', ')
    else
      flags = answers.map {|a| a[:flag] }
      LETTERS.values_at(*flags.each_index.select {|i| flags[i] == '1' }).join(', ')
    end
  end

  private

  def translated_xmlfile
    base_xmlfile = Rails.root.join(@entry.xmlfile).to_s
    translated_xmlfile = "#{base_xmlfile.to_s[0..-5]}_#{I18n.locale}.xml"
    File.exist?(translated_xmlfile) ? translated_xmlfile : base_xmlfile
  end

  def doc
    @doc ||= Nokogiri::XML(File.open(Rails.root.join(translated_xmlfile)).read)
  end

  def testing
    @testing ||= doc.elements[0]
  end
end
