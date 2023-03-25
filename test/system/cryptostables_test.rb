
require "application_system_test_case"

class CryptostablesTest < ApplicationSystemTestCase
  setup do
    @cryptostable = cryptostables(:one)
  end

  test "visiting the index" do
    visit cryptostables_url
    assert_selector "h1", text: "Cryptostables"
  end

  test "creating a Cryptostable" do
    visit cryptostables_url
    click_on "New Cryptostable"

    fill_in "Amount owned", with: @cryptostable.amount_owned
    fill_in "Cost per", with: @cryptostable.cost_per
    fill_in "Symbol", with: @cryptostable.symbol
    fill_in "User", with: @cryptostable.user_id
    click_on "Create Cryptostable"

    assert_text "Cryptostable was successfully created"
    click_on "Back"
  end

  test "updating a Cryptostable" do
    visit cryptostables_url
    click_on "Edit", match: :first

    fill_in "Amount owned", with: @cryptostable.amount_owned
    fill_in "Cost per", with: @cryptostable.cost_per
    fill_in "Symbol", with: @cryptostable.symbol
    fill_in "User", with: @cryptostable.user_id
    click_on "Update Cryptostable"

    assert_text "Cryptostable was successfully updated"
    click_on "Back"
  end

  test "destroying a Cryptostable" do
    visit cryptostables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cryptostable was successfully destroyed"
  end
end