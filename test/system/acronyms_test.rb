require "application_system_test_case"

class AcronymsTest < ApplicationSystemTestCase
  setup do
    @acronym = acronyms(:one)
  end

  test "visiting the index" do
    visit acronyms_url
    assert_selector "h1", text: "Acronyms"
  end

  test "creating a Acronym" do
    visit acronyms_url
    click_on "New Acronym"

    fill_in "Is Master", with: @acronym.is_master
    fill_in "Like", with: @acronym.like_id
    fill_in "Term", with: @acronym.term
    click_on "Create Acronym"

    assert_text "Acronym was successfully created"
    click_on "Back"
  end

  test "updating a Acronym" do
    visit acronyms_url
    click_on "Edit", match: :first

    fill_in "Is Master", with: @acronym.is_master
    fill_in "Like", with: @acronym.like_id
    fill_in "Term", with: @acronym.term
    click_on "Update Acronym"

    assert_text "Acronym was successfully updated"
    click_on "Back"
  end

  test "destroying a Acronym" do
    visit acronyms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Acronym was successfully destroyed"
  end
end
