require 'test_helper'

class AcronymsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @acronym = acronyms(:one)
  end

  test "should get index" do
    get acronyms_url
    assert_response :success
  end

  test "should get new" do
    get new_acronym_url
    assert_response :success
  end

  test "should create acronym" do
    assert_difference('Acronym.count') do
      post acronyms_url, params: { acronym: { is_master: @acronym.is_master, like_id: @acronym.like_id, term: @acronym.term } }
    end

    assert_redirected_to acronym_url(Acronym.last)
  end

  test "should show acronym" do
    get acronym_url(@acronym)
    assert_response :success
  end

  test "should get edit" do
    get edit_acronym_url(@acronym)
    assert_response :success
  end

  test "should update acronym" do
    patch acronym_url(@acronym), params: { acronym: { is_master: @acronym.is_master, like_id: @acronym.like_id, term: @acronym.term } }
    assert_redirected_to acronym_url(@acronym)
  end

  test "should destroy acronym" do
    assert_difference('Acronym.count', -1) do
      delete acronym_url(@acronym)
    end

    assert_redirected_to acronyms_url
  end
end
