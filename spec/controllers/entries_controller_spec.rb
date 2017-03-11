describe EntriesController, type: :controller do
  let!(:wh6_course) { create(:entry, category: "wh", course: "wh6", level: 2) }
  let!(:wh6_entry)  { create(:entry, category: "wh", course: "wh6", level: 3) }
  let!(:wh7_course) { create(:entry, category: "wh", course: "wh7", level: 2) }
  let!(:wh7_entry)  { create(:entry, category: "wh", course: "wh7", level: 3) }
  let!(:uh7_course) { create(:entry, category: "uh", course: "uh7", level: 2) }

  describe "GET #category" do
    it "assigns all entries from the category as @entries" do
      get :category, params: {locale: "uk", category: "wh"}
      expect(assigns(:entries).to_a).to eq([wh6_course, wh7_course])
    end
  end

  describe "GET #course" do
    it "assigns all entries from the course as @entries" do
      get :course, params: {locale: "uk", course: "wh7"}
      expect(assigns(:entries).to_a).to eq([wh7_entry])
    end
  end

  describe "GET #show" do
    it "assigns the requested entry as @entry" do
      get :show, params: {locale: "uk", course: "wh7", id: wh7_entry.to_param}
      expect(assigns(:entry)).to eq(wh7_entry)
    end

    it "redirects to the proper course" do
      get :show, params: {locale: "uk", course: "uh7", id: wh7_entry.to_param}
      expect(response).to redirect_to(show_entry_path(locale: "uk", course: "wh7", id: wh7_entry.to_param))
    end

    it "renders text template when entry has no maps or pictures" do
      get :show, params: {locale: "uk", course: "wh7", id: wh7_entry.to_param}
      expect(response).to render_template(:text)
    end

    it "renders show template when entry has maps" do
      wh7_entry.update(maps: ["01"])
      get :show, params: {locale: "uk", course: "wh7", id: wh7_entry.to_param}
      expect(response).to render_template(:show)
    end

    it "renders show template when entry has pictures" do
      wh7_entry.update(pictures: ["01"])
      get :show, params: {locale: "uk", course: "wh7", id: wh7_entry.to_param}
      expect(response).to render_template(:show)
    end

    it "renders questions template when entry has xmlfile" do
      wh7_entry.update(xmlfile: "01")
      get :show, params: {locale: "uk", course: "wh7", id: wh7_entry.to_param}
      expect(response).to render_template(:questions)
    end

    it "renders video template when entry has video_file" do
      wh7_entry.update(video_file: "video/Chernigov.flv")
      get :show, params: {locale: "uk", course: "wh7", id: wh7_entry.to_param}
      expect(response).to render_template(:video)
    end
  end
end
