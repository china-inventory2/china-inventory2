require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get new" do
    get new_item_url
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post items_url, params: { item: { amazon: @item.amazon, buy_china_item_title: @item.buy_china_item_title, buy_china_item_url: @item.buy_china_item_url, china_item_picture: @item.china_item_picture, item_number: @item.item_number, item_picture: @item.item_picture, item_title: @item.item_title, jan_code: @item.jan_code, mercari: @item.mercari, part_number: @item.part_number, rakuma: @item.rakuma, rakuten: @item.rakuten, researcher_id: @item.researcher_id, sell_japan_url: @item.sell_japan_url, simulate_price: @item.simulate_price, team_id: @item.team_id, yahoo: @item.yahoo, yahooshopping: @item.yahooshopping } }
    end

    assert_redirected_to item_url(Item.last)
  end

  test "should show item" do
    get item_url(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_url(@item)
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item), params: { item: { amazon: @item.amazon, buy_china_item_title: @item.buy_china_item_title, buy_china_item_url: @item.buy_china_item_url, china_item_picture: @item.china_item_picture, item_number: @item.item_number, item_picture: @item.item_picture, item_title: @item.item_title, jan_code: @item.jan_code, mercari: @item.mercari, part_number: @item.part_number, rakuma: @item.rakuma, rakuten: @item.rakuten, researcher_id: @item.researcher_id, sell_japan_url: @item.sell_japan_url, simulate_price: @item.simulate_price, team_id: @item.team_id, yahoo: @item.yahoo, yahooshopping: @item.yahooshopping } }
    assert_redirected_to item_url(@item)
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete item_url(@item)
    end

    assert_redirected_to items_url
  end
end
