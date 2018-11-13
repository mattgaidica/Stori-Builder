require 'test_helper'

class StrandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @strand = strands(:one)
  end

  test "should get index" do
    get strands_url
    assert_response :success
  end

  test "should get new" do
    get new_strand_url
    assert_response :success
  end

  test "should create strand" do
    assert_difference('Strand.count') do
      post strands_url, params: { strand: { position: @strand.position } }
    end

    assert_redirected_to strand_url(Strand.last)
  end

  test "should show strand" do
    get strand_url(@strand)
    assert_response :success
  end

  test "should get edit" do
    get edit_strand_url(@strand)
    assert_response :success
  end

  test "should update strand" do
    patch strand_url(@strand), params: { strand: { position: @strand.position } }
    assert_redirected_to strand_url(@strand)
  end

  test "should destroy strand" do
    assert_difference('Strand.count', -1) do
      delete strand_url(@strand)
    end

    assert_redirected_to strands_url
  end
end
