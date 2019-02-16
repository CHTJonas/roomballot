require "application_system_test_case"

class TimetableItemsTest < ApplicationSystemTestCase
  setup do
    @timetable_item = timetable_items(:one)
  end

  test "visiting the index" do
    visit timetable_items_url
    assert_selector "h1", text: "Timetable Items"
  end

  test "creating a Timetable item" do
    visit timetable_items_url
    click_on "New Timetable Item"

    fill_in "Description", with: @timetable_item.description
    fill_in "When", with: @timetable_item.when
    click_on "Create Timetable item"

    assert_text "Timetable item was successfully created"
    click_on "Back"
  end

  test "updating a Timetable item" do
    visit timetable_items_url
    click_on "Edit", match: :first

    fill_in "Description", with: @timetable_item.description
    fill_in "When", with: @timetable_item.when
    click_on "Update Timetable item"

    assert_text "Timetable item was successfully updated"
    click_on "Back"
  end

  test "destroying a Timetable item" do
    visit timetable_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Timetable item was successfully destroyed"
  end
end
