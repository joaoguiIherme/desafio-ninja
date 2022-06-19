require 'rails_helper'

RSpec.describe Api::V1::SchedulingsController, type: :controller do
  before do
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    sign_in create(:user)
  end

  describe 'GET #index' do
    let!(:scheduling) { create(:scheduling) }

    before { get :index }

    it 'returns the correct data' do
      expect(JSON.parse(response.body).first).to eq(scheduling.as_json(only: %i[room_id user_id start_time end_time]))
    end

    it 'returns the correct response' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    let!(:scheduling) { create(:scheduling) }

    before { get :show, params: { id: scheduling.id } }

    it 'returns the correct data' do
      expect(JSON.parse(response.body)).to eq(scheduling.as_json(only: %i[room_id user_id start_time end_time]))
    end

    it 'returns the correct response' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    let!(:user) { create(:user) }
    let!(:room) { create(:room) }
    let!(:attributes) do
      {
        start_time: '15-08-2023 14:10',
        end_time: '15-08-2023 17:45'
      }
    end

    before { post :create, params: { scheduling: attributes, room_id: room.id, user_id: user.id } }

    it { expect(Scheduling.first).to have_attributes(attributes) }
  end

  describe 'PUT #update' do
    let!(:scheduling) { create(:scheduling) }

    let!(:attributes) do
      {
        start_time: '15-08-2023 15:30'
      }
    end

    before { put :update, params: { id: scheduling.id, scheduling: attributes } }

    it { expect(scheduling.reload).to have_attributes(attributes) }
  end

  describe 'DELETE #destroy' do
    let!(:scheduling) { create(:scheduling) }

    before { delete :destroy, params: { id: scheduling.id } }

    it { expect(Scheduling.exists?(scheduling.id)).to be(false) }
  end
end
