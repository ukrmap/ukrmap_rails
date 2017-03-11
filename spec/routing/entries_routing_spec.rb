RSpec.describe EntriesController, type: :routing do
  describe "routing" do
    it "routes to #category" do
      expect(get: "/uk-wh").to route_to("entries#category", locale: "uk", category: "wh")
    end

    it "routes to #course" do
      expect(get: "/uk-wh7").to route_to("entries#course", locale: "uk", course: "wh7")
    end

    it "routes to #show" do
      expect(get: "/uk-wh7/1.html").to route_to("entries#show", locale: "uk", course: "wh7", id: "1")
    end
  end
end
