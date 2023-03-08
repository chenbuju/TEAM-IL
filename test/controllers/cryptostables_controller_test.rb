
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
    end

    assert_redirected_to cryptostable_url(Cryptostable.last)
  end

  test "should show cryptostable" do
    get cryptostable_url(@cryptostable)
    assert_response :success
  end

  test "should get edit" do
    get edit_cryptostable_url(@cryptostable)
    assert_response :success
  end

  test "should update cryptostable" do
    patch cryptostable_url(@cryptostable), params: { cryptostable: { amount_owned: @cryptostable.amount_owned, cost_per: @cryptostable.cost_per, symbol: @cryptostable.symbol, user_id: @cryptostable.user_id } }
    assert_redirected_to cryptostable_url(@cryptostable)
  end

  test "should destroy cryptostable" do
    assert_difference('Cryptostable.count', -1) do
      delete cryptostable_url(@cryptostable)
    end

    assert_redirected_to cryptostables_url
  end
end