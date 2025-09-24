require 'rails_helper'

RSpec.describe "Admin::Dashboard", type: :request do
  let(:admin) { create(:user, role: :admin) }
  let(:user) { create(:user, role: :user) }

  describe "GET /admin/dashboard" do
    context "quando admin" do
      before do
        sign_in admin, scope: :user
        get "/admin/dashboard"
      end

      it "retorna sucesso" do
        expect(response).to have_http_status(:success)
      end
    end

    context "quando usuário normal" do
      before do
        sign_in user, scope: :user
        get "/admin/dashboard"
      end

      it "redireciona para root_path" do
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
