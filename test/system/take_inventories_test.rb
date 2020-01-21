require "application_system_test_case"

class TakeInventoriesTest < ApplicationSystemTestCase
  setup do
    @take_inventory = take_inventories(:one)
  end

  test "visiting the index" do
    visit take_inventories_url
    assert_selector "h1", text: "Take Inventories"
  end

  test "creating a Take inventory" do
    visit take_inventories_url
    click_on "New Take Inventory"

    fill_in "Beginning product inventory", with: @take_inventory.beginning_product_inventory
    fill_in "Cost of sales", with: @take_inventory.cost_of_sales
    fill_in "Fiscal year", with: @take_inventory.fiscal_year
    fill_in "Period end product inventory", with: @take_inventory.period_end_product_inventory
    fill_in "User", with: @take_inventory.user_id
    click_on "Create Take inventory"

    assert_text "Take inventory was successfully created"
    click_on "Back"
  end

  test "updating a Take inventory" do
    visit take_inventories_url
    click_on "Edit", match: :first

    fill_in "Beginning product inventory", with: @take_inventory.beginning_product_inventory
    fill_in "Cost of sales", with: @take_inventory.cost_of_sales
    fill_in "Fiscal year", with: @take_inventory.fiscal_year
    fill_in "Period end product inventory", with: @take_inventory.period_end_product_inventory
    fill_in "User", with: @take_inventory.user_id
    click_on "Update Take inventory"

    assert_text "Take inventory was successfully updated"
    click_on "Back"
  end

  test "destroying a Take inventory" do
    visit take_inventories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Take inventory was successfully destroyed"
  end
end
