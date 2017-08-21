require 'test_helper'

class TicketConferencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket_conference = ticket_conferences(:one)
  end

  test "should get index" do
    get ticket_conferences_url
    assert_response :success
  end

  test "should get new" do
    get new_ticket_conference_url
    assert_response :success
  end

  test "should create ticket_conference" do
    assert_difference('TicketConference.count') do
      post ticket_conferences_url, params: { ticket_conference: { Conference_id: @ticket_conference.Conference_id, TicketConference_assistance: @ticket_conference.TicketConference_assistance, Ticket_id: @ticket_conference.Ticket_id } }
    end

    assert_redirected_to ticket_conference_url(TicketConference.last)
  end

  test "should show ticket_conference" do
    get ticket_conference_url(@ticket_conference)
    assert_response :success
  end

  test "should get edit" do
    get edit_ticket_conference_url(@ticket_conference)
    assert_response :success
  end

  test "should update ticket_conference" do
    patch ticket_conference_url(@ticket_conference), params: { ticket_conference: { Conference_id: @ticket_conference.Conference_id, TicketConference_assistance: @ticket_conference.TicketConference_assistance, Ticket_id: @ticket_conference.Ticket_id } }
    assert_redirected_to ticket_conference_url(@ticket_conference)
  end

  test "should destroy ticket_conference" do
    assert_difference('TicketConference.count', -1) do
      delete ticket_conference_url(@ticket_conference)
    end

    assert_redirected_to ticket_conferences_url
  end
end
