require "application_system_test_case"

class StrandsTest < ApplicationSystemTestCase
  setup do
    @strand = strands(:one)
  end

  test "visiting the index" do
    visit strands_url
    assert_selector "h1", text: "Strands"
  end

  test "creating a Strand" do
    visit strands_url
    click_on "New Strand"

    fill_in "Position", with: @strand.position
    click_on "Create Strand"

    assert_text "Strand was successfully created"
    click_on "Back"
  end

  test "updating a Strand" do
    visit strands_url
    click_on "Edit", match: :first

    fill_in "Position", with: @strand.position
    click_on "Update Strand"

    assert_text "Strand was successfully updated"
    click_on "Back"
  end

  test "destroying a Strand" do
    visit strands_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Strand was successfully destroyed"
  end
end
