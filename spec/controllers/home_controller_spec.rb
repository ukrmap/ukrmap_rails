describe HomeController, type: :controller do
  describe 'GET #index' do
    it 'renders view :index by default' do
      get :index, params: { locale: 'uk' }
      expect(response).to render_template(:index)
    end

    it 'renders view "home/search" when exists search query parameter' do
      get :index, params: { locale: 'uk', q: 'test' }
      expect(response).to render_template(:search)
    end

    context 'search results' do
      let!(:entry_mazepa) { create(:entry, title_uk: 'Гетьман Іван Мазепа', level: 3) }
      before { create(:entry, title_uk: 'Кліматична карта світу', level: 3) }

      it 'assigns search results as @entries' do
        get :index, params: { locale: 'uk', q: 'мазепа' }
        expect(assigns(:entries)).to eq([entry_mazepa])
      end
    end
  end
end
