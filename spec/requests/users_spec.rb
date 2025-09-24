require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }

  describe "GET /dashboard" do
    it "retorna http success" do
      sign_in user  # Devise IntegrationHelpers já estão incluídos
      get dashboard_path
      expect(response).to have_http_status(:success)
    end
  end
end
