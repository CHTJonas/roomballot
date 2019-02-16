require 'test_helper'

class TimetableItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timetable_item = timetable_items(:one)
  end

  test "should get index" do
    get timetable_items_url
    assert_response :success
  end

  test "should get new" do
    get new_timetable_item_url
    assert_response :success
  end

  test "should create timetable_item" do
    assert_difference('TimetableItem.count') do
      post timetable_items_url, params: { timetable_item: { description: @timetable_item.description, when: @timetable_item.when } }
    end

    assert_redirected_to timetable_item_url(TimetableItem.last)
  end

  test "should show timetable_item" do
    get timetable_item_url(@timetable_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_timetable_item_url(@timetable_item)
    assert_response :success
  end

  test "should update timetable_item" do
    patch timetable_item_url(@timetable_item), params: { timetable_item: { description: @timetable_item.description, when: @timetable_item.when } }
    assert_redirected_to timetable_item_url(@timetable_item)
  end

  test "should destroy timetable_item" do
    assert_difference('TimetableItem.count', -1) do
      delete timetable_item_url(@timetable_item)
    end

    assert_redirected_to timetable_items_url
  end
end
