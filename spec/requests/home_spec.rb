RSpec.describe "Home", type: :request do
  before do
    create(:entry, category: "g", level: 1, title_en: "Geography")
    create(:entry, category: "wh", level: 1, title_uk: "World History")
    create(:entry, category: "uh", level: 1, title_uk: "History of Ukraine")
    create(:entry, category: "wh", course: "wh6", level: 2, title_en: "World History Grade 6")
    create(:entry, category: "wh", course: "wh7", level: 2, title_en: "World History Grade 7")
  end

  describe "GET /" do
    it "displays all courses" do
      I18n.with_locale(:en) do
        get root_path
        expect(response).to have_http_status(200)
        expect(response).to render_template(:index)
        expect(response.body).to include("World History Grade 6")
        expect(response.body).to include("World History Grade 7")
      end
    end
  end
end
