require 'test_helper'

class TicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket = tickets(:one)
  end

  test "should get index" do
    get tickets_url
    assert_response :success
  end

  test "should get new" do
    get new_ticket_url
    assert_response :success
  end

  test "should create ticket" do
    assert_difference('Ticket.count') do
      post tickets_url, params: { ticket: { ticket_age: @ticket.ticket_age, ticket_badgeNumber: @ticket.ticket_badgeNumber, ticket_course: @ticket.ticket_course, ticket_email: @ticket.ticket_email, ticket_name: @ticket.ticket_name, ticket_other: @ticket.ticket_other, ticket_reference: @ticket.ticket_reference, ticket_registered: @ticket.ticket_registered, ticket_schoolId: @ticket.ticket_schoolId, ticket_semester: @ticket.ticket_semester, ticket_sex: @ticket.ticket_sex, ticket_ticketTypeId: @ticket.ticket_ticketTypeId, ticket_university: @ticket.ticket_university } }
    end

    assert_redirected_to ticket_url(Ticket.last)
  end

  test "should show ticket" do
    get ticket_url(@ticket)
    assert_response :success
  end

  test "should get edit" do
    get edit_ticket_url(@ticket)
    assert_response :success
  end

  test "should update ticket" do
    patch ticket_url(@ticket), params: { ticket: { ticket_age: @ticket.ticket_age, ticket_badgeNumber: @ticket.ticket_badgeNumber, ticket_course: @ticket.ticket_course, ticket_email: @ticket.ticket_email, ticket_name: @ticket.ticket_name, ticket_other: @ticket.ticket_other, ticket_reference: @ticket.ticket_reference, ticket_registered: @ticket.ticket_registered, ticket_schoolId: @ticket.ticket_schoolId, ticket_semester: @ticket.ticket_semester, ticket_sex: @ticket.ticket_sex, ticket_ticketTypeId: @ticket.ticket_ticketTypeId, ticket_university: @ticket.ticket_university } }
    assert_redirected_to ticket_url(@ticket)
  end

  test "should destroy ticket" do
    assert_difference('Ticket.count', -1) do
      delete ticket_url(@ticket)
    end

    assert_redirected_to tickets_url
  end
end
