describe EntriesHelper, type: :helper do
  describe "entry_path" do
    let(:g_category) { build_stubbed(:entry, category: "g", level: 1, title_uk: "Географія") }
    let(:wh7_course) { build_stubbed(:entry, category: "wh", course: "wh7", level: 2, title_uk: "Всесвітня історія 7 клас") }
    let(:wh7_entry)  { build_stubbed(:entry, category: "wh", course: "wh7", level: 3, title_uk: "Виникнення об’єднаного Іспанського королівства", maps: ["01"]) }

    it "returns category_path for entry with level 1" do
      expect(helper.entry_path(g_category)).to eq("/uk-g")
    end

    it "returns course_path for entry with level 2" do
      expect(helper.entry_path(wh7_course)).to eq("/uk-wh7")
    end

    it "returns show_entry_path for entry with level 2" do
      expect(helper.entry_path(wh7_entry)).to eq("/uk-wh7/#{wh7_entry.id}.html")
    end
  end
end
