require "application_system_test_case"

class BuyItemsTest < ApplicationSystemTestCase
  setup do
    @buy_item = buy_items(:one)
  end

  test "visiting the index" do
    visit buy_items_url
    assert_selector "h1", text: "Buy Items"
  end

  test "creating a Buy item" do
    visit buy_items_url
    click_on "New Buy Item"

    fill_in "China image url", with: @buy_item.china_image_url
    fill_in "China price", with: @buy_item.china_price
    fill_in "China title", with: @buy_item.china_title
    fill_in "China url", with: @buy_item.china_url
    fill_in "Item description", with: @buy_item.item_description
    fill_in "Japan image url", with: @buy_item.japan_image_url
    fill_in "Japan price", with: @buy_item.japan_price
    fill_in "Japan title", with: @buy_item.japan_title
    fill_in "Japan url", with: @buy_item.japan_url
    fill_in "Team", with: @buy_item.team_id
    click_on "Create Buy item"

    assert_text "Buy item was successfully created"
    click_on "Back"
  end

  test "updating a Buy item" do
    visit buy_items_url
    click_on "Edit", match: :first

    fill_in "China image url", with: @buy_item.china_image_url
    fill_in "China price", with: @buy_item.china_price
    fill_in "China title", with: @buy_item.china_title
    fill_in "China url", with: @buy_item.china_url
    fill_in "Item description", with: @buy_item.item_description
    fill_in "Japan image url", with: @buy_item.japan_image_url
    fill_in "Japan price", with: @buy_item.japan_price
    fill_in "Japan title", with: @buy_item.japan_title
    fill_in "Japan url", with: @buy_item.japan_url
    fill_in "Team", with: @buy_item.team_id
    click_on "Update Buy item"

    assert_text "Buy item was successfully updated"
    click_on "Back"
  end

  test "destroying a Buy item" do
    visit buy_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Buy item was successfully destroyed"
  end
end
