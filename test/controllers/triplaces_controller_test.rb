require 'test_helper'

class TriplacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @triplace = triplaces(:one)
  end

  test "should get index" do
    get triplaces_url
    assert_response :success
  end

  test "should get new" do
    get new_triplace_url
    assert_response :success
  end

  test "should create triplace" do
    assert_difference('Triplace.count') do
      post triplaces_url, params: { triplace: {  } }
    end

    assert_redirected_to triplace_url(Triplace.last)
  end

  test "should show triplace" do
    get triplace_url(@triplace)
    assert_response :success
  end

  test "should get edit" do
    get edit_triplace_url(@triplace)
    assert_response :success
  end

  test "should update triplace" do
    patch triplace_url(@triplace), params: { triplace: {  } }
    assert_redirected_to triplace_url(@triplace)
  end

  test "should destroy triplace" do
    assert_difference('Triplace.count', -1) do
      delete triplace_url(@triplace)
    end

    assert_redirected_to triplaces_url
  end
end
