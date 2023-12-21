# spec/requests/users_spec.rb

require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get users_path
      expect(response.body).to include('<h1>Hello! this is the users index</h1>')
    end
  end

  describe 'GET #show' do
    let(:user) { create(:user) }

    it 'returns a successful response' do
      get user_path(user)
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get user_path(user)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get users_path
      expect(response.body).to include('<h1>Hello! this is the users index</h1>')
      # Update the expectation to match the actual content of your index view
    end
  end
end
