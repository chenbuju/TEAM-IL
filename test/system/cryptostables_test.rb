
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