RSpec.describe "Entries", type: :request do
  let!(:g_category) { create(:entry, category: "g", level: 1, title_uk: "Географія") }
  let!(:wh_category) { create(:entry, category: "wh", level: 1, title_uk: "Всесвітня історія") }
  let!(:uh_category) { create(:entry, category: "uh", level: 1, title_uk: "Історія України") }
  let!(:wh6_course) { create(:entry, category: "wh", course: "wh6", level: 2, title_uk: "Всесвітня історія 6 клас") }
  let!(:wh7_course) { create(:entry, category: "wh", course: "wh7", level: 2, title_uk: "Всесвітня історія 7 клас") }
  let!(:wh7_entry)  { create(:entry, category: "wh", course: "wh7", level: 3, title_uk: "Виникнення об’єднаного Іспанського королівства", dir2: "wh7a", maps: ["01"], parent: wh7_course, tutorial: "textbook") }

  describe "GET /uk-wh" do
    it "displays all courses from the category" do
      get category_path({locale: "uk", category: "wh"})
      expect(response).to have_http_status(200)
      expect(response).to render_template(:category)
      expect(response.body).to include("<h1>Всесвітня історія</h1>")
      expect(response.body).to include("Всесвітня історія 7 клас")
    end
  end

  describe "GET /uk-wh7" do
    it "displays all entries from the course" do
      get course_path({locale: "uk", course: "wh7"})
      expect(response).to have_http_status(200)
      expect(response).to render_template(:course)
      expect(response.body).to include("<h1>Всесвітня історія 7 клас</h1>")
      expect(response.body).to include("Виникнення об’єднаного Іспанського королівства")
    end
  end

  describe "GET /uk-wh7/:id.html" do
    it "displays entry" do
      get show_entry_path({locale: "uk", course: "wh7", id: wh7_entry.to_param})
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
      expect(response.body).to include('<h1>Виникнення об’єднаного Іспанського королівства <i style="color: grey;"> (підручник)</i></h1>')
    end

    it "redirects to entry's course" do
      get show_entry_path({locale: "uk", course: "wh6", id: wh7_entry.to_param})
      expect(response).to redirect_to(show_entry_path(locale: "uk", course: "wh7", id: wh7_entry.to_param))
    end
  end
end
