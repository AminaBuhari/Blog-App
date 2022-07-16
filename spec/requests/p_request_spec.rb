require 'rails_helper'

RSpec.describe "Ps", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/p/new"
      expect(response).to have_http_status(:success)
    end
  end

end
