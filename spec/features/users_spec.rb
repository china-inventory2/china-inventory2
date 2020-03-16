require 'rails_helper'

RSpec.feature "Users", type: :feature do
  # アカウント作成関連
  scenario "アカウント作成に成功する" do
    visit new_user_path
    fill_in "Name", with: "tester"
    fill_in "Employee number", with: "t"
    fill_in "Line", with: "aaaa"
    fill_in "Email", with: "tester@email.com"
    fill_in "Address", with: "aichi"
    fill_in "Phone number", with: "000"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    check "在庫管理"
    click_on "新規作成"
    expect(page).to have_content "アカウントを作成しました。"
  end
  scenario "アカウント作成に失敗する" do
    visit new_user_path
    fill_in "Name", with: "tester"
    click_on "新規作成"
    expect(page).to have_content "個の入力不足があります"
  end
end
