require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    before do
      FactoryBot.create(:user)
      FactoryBot.create(:second_user)
    end
    # indexリクエストが成功すること
    it 'returns status code 200' do
      get users_path
      expect(response).to have_http_status(200)
    end
  end
  describe "GET /users/id show" do
    before do
      @user = FactoryBot.create(:user)
    end
    # ログインしていないのでリダイレクトされること
    it "returns status code 302" do
      get user_path(@user.id)
      expect(response).to have_http_status(302)
    end
  end
  describe "GET /usrs/id/edit" do
    before do
      @user = FactoryBot.create(:user)
    end
    # ログインしていないのでリダイレクトされること
    it "returns status code 302" do
      get edit_user_path(@user)
      expect(response).to have_http_status(302)
    end
  end
  # newアクションのリクエストが成功すること
  describe "GET /usrs/new" do
    before do
      @user = FactoryBot.create(:user)
    end
    it "returns status code 200" do
      get new_user_path
      expect(response).to have_http_status(200)
    end
  end
  # newアクションのリクエストが成功すること
  describe 'POST #create' do
    # パラメータが妥当な場合
    context 'If the parameters are valid' do
      # リクエストが成功すること
      it 'Request succeeds' do
        post users_path, params: { user: FactoryBot.attributes_for(:user) }
        expect(response.status).to eq 302
      end
      # ユーザーが登録されること
      it "create user" do
        expect do
          post users_path, params: { user: FactoryBot.attributes_for(:user) }
        end.to change(User, :count).by(1)
      end
      # パラメータが不正な場合
      context 'If the parameter is incorrect' do
        # リクエストが成功すること
        it 'Request succeeds' do
          post users_path, params: { user: FactoryBot.attributes_for(:user, :invalid) }
          expect(response.status).to eq 200
        end
        it 'ユーザーが登録されないこと' do
          expect do
            post users_url, params: { user: FactoryBot.attributes_for(:user, :invalid) }
          end.to_not change(User, :count)
        end
        it 'エラーが表示されること' do
          post users_url, params: { user: FactoryBot.attributes_for(:user, :invalid) }
          expect(response.body).to include '個の入力不足があります'
        end
      end
    end
  end
  describe 'put #update' do
    let(:takashi) { FactoryBot.create :takashi }
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        put user_url takashi, params: { user: FactoryBot.attributes_for(:satoshi) }
        expect(response.status).to eq 302
      end
    end
    context 'パラメータが不正な場合' do
      it 'リクエストが成功すること' do
        put user_url takashi, params: { user: FactoryBot.attributes_for(:user, :invalid) }
        expect(response.status).to eq 302
      end
    end
  end
  describe 'DELETE #destroy' do
    let!(:user) { FactoryBot.create :user }

    it 'リクエストが成功すること' do
      delete user_path user
      expect(response.status).to eq 302
    end
    it 'ユーザーが削除されること' do
      expect do
        delete user_url user
      end.to change(User, :count).by(-1)
    end
    it 'ユーザー一覧にリダイレクトすること' do
      delete user_url user
      expect(response).to redirect_to(users_url)
    end
  end
end
