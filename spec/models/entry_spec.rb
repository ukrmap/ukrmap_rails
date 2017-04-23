require "shoulda/matchers"

RSpec.describe Entry, type: :model do
  describe "database" do
    it { should have_db_column(:category).of_type(:string) }
    it { should have_db_column(:course).of_type(:string) }
    it { should have_db_column(:parent_id).of_type(:integer) }
    it { should have_db_column(:level).of_type(:integer) }
    it { should have_db_column(:dir2).of_type(:string) }
    it { should have_db_column(:tutorial).of_type(:string) }
    it { should have_db_column(:title_ru).of_type(:string) }
    it { should have_db_column(:title_uk).of_type(:string) }
    it { should have_db_column(:title_en).of_type(:string) }
    it { should have_db_column(:title_be).of_type(:string) }
    it { should have_db_column(:content_ru).of_type(:text) }
    it { should have_db_column(:content_uk).of_type(:text) }
    it { should have_db_column(:content_en).of_type(:text) }
    it { should have_db_column(:content_be).of_type(:text) }
    it { should have_db_column(:dir).of_type(:string) }
    it { should have_db_column(:text_file).of_type(:string) }
    it { should have_db_column(:maps).of_type(:text) }
    it { should have_db_column(:maps_names_ru).of_type(:text) }
    it { should have_db_column(:maps_names_uk).of_type(:text) }
    it { should have_db_column(:maps_names_en).of_type(:text) }
    it { should have_db_column(:maps_names_be).of_type(:text) }
    it { should have_db_column(:legend).of_type(:text) }
    it { should have_db_column(:legends).of_type(:text) }
    it { should have_db_column(:pictures).of_type(:text) }
    it { should have_db_column(:video_file).of_type(:string) }
    it { should have_db_column(:xmlfile).of_type(:string) }
    it { should have_db_column(:text_with_title).of_type(:boolean).with_options(default: false, null: false) }
    it { should have_db_column(:sequence).of_type(:integer).with_options(default: 0, null: false) }

    it { should have_db_index(:category) }
    it { should have_db_index(:course) }
    it { should have_db_index(:level) }
    it { should have_db_index(:parent_id) }
  end

  context "associations" do
    it { should belong_to(:parent) }
  end

  describe "#title" do
    let(:entry) { build_stubbed(:entry, title_uk: "Історія України", title_en: "History of Ukraine") }

    it "returns title for curent locale" do
      I18n.with_locale(:uk) do
        expect(entry.title).to eq("Історія України")
      end
      I18n.with_locale(:en) do
        expect(entry.title).to eq("History of Ukraine")
      end
    end
  end

  describe "#content" do
    let(:entry) { build_stubbed(:entry, dir2: "g8a", text_file: "04") }

    it "returns content for curent locale" do
      I18n.with_locale(:uk) do
        expect(entry.content).to include("Географічна карта")
      end
      I18n.with_locale(:en) do
        expect(entry.content).to include("Geographical map")
      end
    end
  end

  describe "#pictures_files_with_names" do
    let(:entry) { build_stubbed(:entry, dir2: "g4a", pictures: "01") }

    it "returns a list of pictures, previews and names" do
      I18n.with_locale(:uk) do
        expect(entry.pictures_files_with_names).to eq([
          ["/images/g4a/01/9.jpg", 351, 389, "/images/g4a/01/9_resize.jpg", "Емблема Київщини з 1672 р."]
        ])
      end
    end
  end

  describe "#testing" do
    it "returns object of class Testing" do
      expect(subject.testing).to be_a(Testing)
    end
  end

  describe "#files_dir" do
    it "returns entry's dir in most cases" do
      expect(Entry.new(dir2: "g8a").files_dir).to eq("g8a")
      expect(Entry.new(dir2: "wh6b").files_dir).to eq("wh6a")
      expect(Entry.new(dir2: "wh11b").files_dir).to eq("wh11a")
    end
  end
end
