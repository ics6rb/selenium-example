# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AjaxController, type: :controller do
  describe 'GET #input' do
    it 'returns http success' do
      get :input
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #result' do
    it 'returns error on empty string' do
      post :result, params: { format: :js, string: '' }

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:result)
      expect(assigns[:result]).to eq('Вы ввели пустую строку.')
    end

    it 'returns same string if string contains one word' do
      string = 'word'

      post :result, params: { format: :js, string: string }

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:result)
      expect(assigns[:result]).to eq(string)
    end

    it 'returns sorted by word length string' do
      string = '1 11 123'
      expected = '123 11 1'

      post :result, params: { format: :js, string: string }

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:result)
      expect(assigns[:result]).to eq(expected)
    end
  end
end
