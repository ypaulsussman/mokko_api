require "test_helper"

class MokkosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mokko = mokkos(:one)
  end

  test "should get index" do
    get mokkos_url, as: :json
    assert_response :success
  end

  test "should create mokko" do
    assert_difference('Mokko.count') do
      post mokkos_url, params: { mokko: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show mokko" do
    get mokko_url(@mokko), as: :json
    assert_response :success
  end

  test "should update mokko" do
    patch mokko_url(@mokko), params: { mokko: {  } }, as: :json
    assert_response 200
  end

  test "should destroy mokko" do
    assert_difference('Mokko.count', -1) do
      delete mokko_url(@mokko), as: :json
    end

    assert_response 204
  end
end
