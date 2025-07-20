require "application_system_test_case"

class GalleriesTest < ApplicationSystemTestCase
  setup do
    @gallery = galleries(:one)
  end

  test "visiting the index" do
    visit galleries_url
    assert_selector "h1", text: "Galleries"
  end

  test "should create gallery" do
    visit galleries_url
    click_on "New gallery"

    fill_in "Title", with: @gallery.title
    fill_in "User", with: @gallery.user_id
    click_on "Create Gallery"

    assert_text "Gallery was successfully created"
    click_on "Back"
  end

  test "should update Gallery" do
    visit gallery_url(@gallery)
    click_on "Edit this gallery", match: :first

    fill_in "Title", with: @gallery.title
    fill_in "User", with: @gallery.user_id
    click_on "Update Gallery"

    assert_text "Gallery was successfully updated"
    click_on "Back"
  end

  test "should destroy Gallery" do
    visit gallery_url(@gallery)
    click_on "Destroy this gallery", match: :first

    assert_text "Gallery was successfully destroyed"
  end
end
