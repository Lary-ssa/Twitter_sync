require 'rails_helper'

RSpec.describe "TwitterMessages", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/twitter_messages"
      expect(response).to have_http_status(:success)
    end
  end

end
