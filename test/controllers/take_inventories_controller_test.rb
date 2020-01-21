require 'test_helper'

class TakeInventoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @take_inventory = take_inventories(:one)
  end

  test "should get index" do
    get take_inventories_url
    assert_response :success
  end

  test "should get new" do
    get new_take_inventory_url
    assert_response :success
  end

  test "should create take_inventory" do
    assert_difference('TakeInventory.count') do
      post take_inventories_url, params: { take_inventory: { beginning_product_inventory: @take_inventory.beginning_product_inventory, cost_of_sales: @take_inventory.cost_of_sales, fiscal_year: @take_inventory.fiscal_year, period_end_product_inventory: @take_inventory.period_end_product_inventory, user_id: @take_inventory.user_id } }
    end

    assert_redirected_to take_inventory_url(TakeInventory.last)
  end

  test "should show take_inventory" do
    get take_inventory_url(@take_inventory)
    assert_response :success
  end

  test "should get edit" do
    get edit_take_inventory_url(@take_inventory)
    assert_response :success
  end

  test "should update take_inventory" do
    patch take_inventory_url(@take_inventory), params: { take_inventory: { beginning_product_inventory: @take_inventory.beginning_product_inventory, cost_of_sales: @take_inventory.cost_of_sales, fiscal_year: @take_inventory.fiscal_year, period_end_product_inventory: @take_inventory.period_end_product_inventory, user_id: @take_inventory.user_id } }
    assert_redirected_to take_inventory_url(@take_inventory)
  end

  test "should destroy take_inventory" do
    assert_difference('TakeInventory.count', -1) do
      delete take_inventory_url(@take_inventory)
    end

    assert_redirected_to take_inventories_url
  end
end
