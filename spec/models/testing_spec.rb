RSpec.describe Testing, type: :model do
  let(:entry) { build_stubbed(:entry, xmlfile: "content/questions/g8/02.xml") }
  subject { described_class.new(entry) }

  describe "#name" do
    it "returns testing name from XML file" do
      I18n.with_locale(:uk) do
        expect(subject.name).to eq("ПРИРОДНІ УМОВИ ТА ПРИРОДНІ РЕСУРСИ")
      end
    end
  end

  describe "#questions" do
    it "returns list of questions" do
      I18n.with_locale(:uk) do
        expect(subject.questions).to have(19).items
        expect(subject.questions[0][:text]).to eq("Найдавнішими архейськими і протерозойськими породами складено:")
      end
    end
  end

  describe ".correct_answers" do
    it "returns text representaion of correct answers for the question" do
      expect(described_class.correct_answers(subject.questions[0])).to eq("c")
      expect(described_class.correct_answers(subject.questions[18])).to eq("1 - b, 2 - c, 3 - a, 4 - d")
    end
  end
end
