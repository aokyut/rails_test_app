require "application_system_test_case"

class KijisTest < ApplicationSystemTestCase
  setup do
    @kiji = kijis(:one)
  end

  test "visiting the index" do
    visit kijis_url
    assert_selector "h1", text: "Kijis"
  end

  test "creating a Kiji" do
    visit kijis_url
    click_on "New Kiji"

    fill_in "Content", with: @kiji.content
    fill_in "Title", with: @kiji.title
    fill_in "User", with: @kiji.user_id
    click_on "Create Kiji"

    assert_text "Kiji was successfully created"
    click_on "Back"
  end

  test "updating a Kiji" do
    visit kijis_url
    click_on "Edit", match: :first

    fill_in "Content", with: @kiji.content
    fill_in "Title", with: @kiji.title
    fill_in "User", with: @kiji.user_id
    click_on "Update Kiji"

    assert_text "Kiji was successfully updated"
    click_on "Back"
  end

  test "destroying a Kiji" do
    visit kijis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kiji was successfully destroyed"
  end
end
