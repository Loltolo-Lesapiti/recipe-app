RSpec.describe 'Recipes', type: :request do
    describe 'GET /index' do
      before(:each) do
        @user = create(:user)
        login_as @user
        @recipe = create(:recipe, user_id: @user.id)
        get '/recipes'
      end
      it 'Test for http status' do
        expect(response).to have_http_status(200)
      end
      it 'Test for correct template' do
        expect(response).to render_template('index')
      end
      it 'Test for response body includes correct placeholder text' do
        expect(response.body).to include 'Recipes'
      end
    end
  
    describe 'GET /show' do
      before(:each) do
        @user = create(:user)
        login_as @user
        @recipe = create(:recipe, user_id: @user.id)
        get '/recipes'
      end
      it 'Test for http status' do
        get "/recipes/#{@recipe.id}"
        expect(response).to have_http_status(200)
      end
      it 'Test for correct template' do
        get "/recipes/#{@recipe.id}"
        expect(response).to render_template('show')
      end
      it 'Test for response body includes correct placeholder text' do
        get "/recipes/#{@recipe.id}"
        expect(response.body).to include @recipe.name
      end
    end
  
    describe 'GET /new' do
      before(:each) do
        @user = create(:user)
        login_as @user
        @recipe = create(:recipe, user_id: @user.id)
        get '/recipes'
      end
      it 'Test for http status' do
        get '/recipes/new'
        expect(response).to have_http_status(200)
      end
      it 'Test for correct template' do
        get '/recipes/new'
        expect(response).to render_template('new')
      end
      it 'Test for response body includes correct placeholder text' do
        get '/recipes/new'
        expect(response.body).to include 'New recipe'
      end
    end
  end