require 'test_helper'

class BuyItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @buy_item = buy_items(:one)
  end

  test "should get index" do
    get buy_items_url
    assert_response :success
  end

  test "should get new" do
    get new_buy_item_url
    assert_response :success
  end

  test "should create buy_item" do
    assert_difference('BuyItem.count') do
      post buy_items_url, params: { buy_item: { china_image_url: @buy_item.china_image_url, china_price: @buy_item.china_price, china_title: @buy_item.china_title, china_url: @buy_item.china_url, item_description: @buy_item.item_description, japan_image_url: @buy_item.japan_image_url, japan_price: @buy_item.japan_price, japan_title: @buy_item.japan_title, japan_url: @buy_item.japan_url, team_id: @buy_item.team_id } }
    end

    assert_redirected_to buy_item_url(BuyItem.last)
  end

  test "should show buy_item" do
    get buy_item_url(@buy_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_buy_item_url(@buy_item)
    assert_response :success
  end

  test "should update buy_item" do
    patch buy_item_url(@buy_item), params: { buy_item: { china_image_url: @buy_item.china_image_url, china_price: @buy_item.china_price, china_title: @buy_item.china_title, china_url: @buy_item.china_url, item_description: @buy_item.item_description, japan_image_url: @buy_item.japan_image_url, japan_price: @buy_item.japan_price, japan_title: @buy_item.japan_title, japan_url: @buy_item.japan_url, team_id: @buy_item.team_id } }
    assert_redirected_to buy_item_url(@buy_item)
  end

  test "should destroy buy_item" do
    assert_difference('BuyItem.count', -1) do
      delete buy_item_url(@buy_item)
    end

    assert_redirected_to buy_items_url
  end
end
