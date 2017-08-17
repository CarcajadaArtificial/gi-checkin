require 'test_helper'

class TicketTypeConferencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket_type_conference = ticket_type_conferences(:one)
  end

  test "should get index" do
    get ticket_type_conferences_url
    assert_response :success
  end

  test "should get new" do
    get new_ticket_type_conference_url
    assert_response :success
  end

  test "should create ticket_type_conference" do
    assert_difference('TicketTypeConference.count') do
      post ticket_type_conferences_url, params: { ticket_type_conference: { Conference_id: @ticket_type_conference.Conference_id, Ticket_Type_id: @ticket_type_conference.Ticket_Type_id } }
    end

    assert_redirected_to ticket_type_conference_url(TicketTypeConference.last)
  end

  test "should show ticket_type_conference" do
    get ticket_type_conference_url(@ticket_type_conference)
    assert_response :success
  end

  test "should get edit" do
    get edit_ticket_type_conference_url(@ticket_type_conference)
    assert_response :success
  end

  test "should update ticket_type_conference" do
    patch ticket_type_conference_url(@ticket_type_conference), params: { ticket_type_conference: { Conference_id: @ticket_type_conference.Conference_id, Ticket_Type_id: @ticket_type_conference.Ticket_Type_id } }
    assert_redirected_to ticket_type_conference_url(@ticket_type_conference)
  end

  test "should destroy ticket_type_conference" do
    assert_difference('TicketTypeConference.count', -1) do
      delete ticket_type_conference_url(@ticket_type_conference)
    end

    assert_redirected_to ticket_type_conferences_url
  end
end
