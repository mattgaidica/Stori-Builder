require "application_system_test_case"

class HoldsTest < ApplicationSystemTestCase
  setup do
    @hold = holds(:one)
  end

  test "visiting the index" do
    visit holds_url
    assert_selector "h1", text: "Holds"
  end

  test "creating a Hold" do
    visit holds_url
    click_on "New Hold"

    click_on "Create Hold"

    assert_text "Hold was successfully created"
    click_on "Back"
  end

  test "updating a Hold" do
    visit holds_url
    click_on "Edit", match: :first

    click_on "Update Hold"

    assert_text "Hold was successfully updated"
    click_on "Back"
  end

  test "destroying a Hold" do
    visit holds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hold was successfully destroyed"
  end
end
