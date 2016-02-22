require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe AirstripController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #launch_planes" do

    it 'could launch plane' do
      put :launch_planes, {planes_count: 1}
      expect(AirstripWorker.jobs.size).to eq(1)
    end
    it 'could launch plane' do
      put :launch_planes, {planes_count: 5}
      expect(AirstripWorker.jobs.size).to eq(5)
    end

    Sidekiq::Testing.disable! do
      it 'could launch 5 plane' do
        put :launch_planes, {planes_count: 1}
        AirstripWorker.drain
        p AirstripLog.last(5)
      end
      it 'could launch 5 plane' do
        put :launch_planes, {planes_count: 5}
        p AirstripLog.last(5)
      end
    end
  end

end
