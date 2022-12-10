require 'rails_helper'

RSpec.describe 'Municipes', type: :request do
  describe 'GET index' do
    it 'responds with ok' do
      get municipes_path, headers: headers_request
      expect(response.status).to eq(200)
    end

    context 'include new directoy' do
      let!(:municipes) { create_list(:municipe, 5) }

      it 'return all Municipes' do
        get municipes_path, headers: headers_request
        expect(response_body_json.size).to eq(5)
      end
    end
  end

  describe 'POST #create' do
    let(:new_record_params) { { municipe: attributes_for(:municipe) }.to_json }
    it 'responds with ok' do
      post municipes_path, headers: headers_request, params: new_record_params
      expect(response.status).to eq(201)
    end

    it 'add a new Municipe' do
      expect do
        post municipes_path, headers: headers_request, params: new_record_params
      end.to change(Municipe, :count).by(1)
    end
  end

  describe 'GET show' do
    let!(:municipe) { create(:municipe) }

    it 'responds with Ok' do
      get municipe_path(id: municipe.id), headers: headers_request
      expect(response.status).to eq(200)
    end
  end

  describe 'PATCH update' do
    let!(:municipe) { create(:municipe) }
    let(:new_name) { 'Fulano' }
    let(:new_params) { { municipe: { name: new_name } }.to_json }

    it 'responds with Ok' do
      patch municipe_path(id: municipe.id), headers: headers_request, params: new_params
      expect(response.status).to eq(200)
    end

    it 'updates Municipe' do
      patch municipe_path(id: municipe.id), headers: headers_request, params: new_params
      municipe.reload
      expect(municipe.name).to eq(new_name)
    end
  end
end
