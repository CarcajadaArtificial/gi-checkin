require 'test_helper'

class AttendeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attendee = attendees(:one)
  end

  test "should get index" do
    get attendees_url
    assert_response :success
  end

  test "should get new" do
    get new_attendee_url
    assert_response :success
  end

  test "should create attendee" do
    assert_difference('Attendee.count') do
      post attendees_url, params: { attendee: { att_course: @attendee.att_course, att_idNumber: @attendee.att_idNumber, att_name: @attendee.att_name, att_registered: @attendee.att_registered, att_semester: @attendee.att_semester, att_ticketNumber: @attendee.att_ticketNumber } }
    end

    assert_redirected_to attendee_url(Attendee.last)
  end

  test "should show attendee" do
    get attendee_url(@attendee)
    assert_response :success
  end

  test "should get edit" do
    get edit_attendee_url(@attendee)
    assert_response :success
  end

  test "should update attendee" do
    patch attendee_url(@attendee), params: { attendee: { att_course: @attendee.att_course, att_idNumber: @attendee.att_idNumber, att_name: @attendee.att_name, att_registered: @attendee.att_registered, att_semester: @attendee.att_semester, att_ticketNumber: @attendee.att_ticketNumber } }
    assert_redirected_to attendee_url(@attendee)
  end

  test "should destroy attendee" do
    assert_difference('Attendee.count', -1) do
      delete attendee_url(@attendee)
    end

    assert_redirected_to attendees_url
  end
end
