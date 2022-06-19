require 'rails_helper'

RSpec.describe Api::V1::RoomsController, type: :controller do
  before do
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    sign_in create(:user)
  end

  describe 'GET #index' do
    let!(:room) { create(:room) }

    before { get :index }

    it 'returns the correct data' do
      expect(JSON.parse(response.body).first).to eq(room.as_json(only: %i[id name number], include: [:schedulings]))
    end

    it 'returns the correct response' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    let!(:room) { create(:room) }

    before { get :show, params: { id: room.id } }

    it 'returns the correct data' do
      expect(JSON.parse(response.body)).to eq(room.as_json(only: %i[id name number], include: [:schedulings]))
    end

    it 'returns the correct response' do
      expect(response).to have_http_status(:success)
    end
  end
end
