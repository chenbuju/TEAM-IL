
require 'test_helper'

class CryptostablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cryptostable = cryptostables(:one)
  end

  test "should get index" do
    get cryptostables_url
    assert_response :success
  end

  test "should get new" do
    get new_cryptostable_url
    assert_response :success
  end

  test "should create cryptostable" do
    assert_difference('Cryptostable.count') do
      post cryptostables_url, params: { cryptostable: { amount_owned: @cryptostable.amount_owned, cost_per: @cryptostable.cost_per, symbol: @cryptostable.symbol, user_id: @cryptostable.user_id } }