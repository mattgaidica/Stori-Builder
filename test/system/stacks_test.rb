require "application_system_test_case"

class StacksTest < ApplicationSystemTestCase
  setup do
    @stack = stacks(:one)
  end

  test "visiting the index" do
    visit stacks_url
    assert_selector "h1", text: "Stacks"
  end

  test "creating a Stack" do
    visit stacks_url
    click_on "New Stack"

    fill_in "Name", with: @stack.name
    fill_in "Pref Annotations Showsource", with: @stack.pref_annotations_showsource
    fill_in "Pref Settings Importpath", with: @stack.pref_settings_importpath
    click_on "Create Stack"

    assert_text "Stack was successfully created"
    click_on "Back"
  end

  test "updating a Stack" do
    visit stacks_url
    click_on "Edit", match: :first

    fill_in "Name", with: @stack.name
    fill_in "Pref Annotations Showsource", with: @stack.pref_annotations_showsource
    fill_in "Pref Settings Importpath", with: @stack.pref_settings_importpath
    click_on "Update Stack"

    assert_text "Stack was successfully updated"
    click_on "Back"
  end

  test "destroying a Stack" do
    visit stacks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stack was successfully destroyed"
  end
end
