require 'rails_helper'

RSpec.describe 'HelthCheck', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/healthcheck'
      expect(response.body).to eq('ok')
      expect(response.status).to eq(200)
    end
  end
end
