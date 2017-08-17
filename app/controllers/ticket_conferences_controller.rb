class TicketConferencesController < ApplicationController
  before_action :set_ticket_conference, only: [:show, :edit, :update, :destroy]

  # GET /ticket_conferences
  # GET /ticket_conferences.json
  def index
    @ticket_conferences = TicketConference.all
  end

  # GET /ticket_conferences/1
  # GET /ticket_conferences/1.json
  def show
  end

  # GET /ticket_conferences/new
  def new
    @ticket_conference = TicketConference.new
  end

  # GET /ticket_conferences/1/edit
  def edit
  end

  # POST /ticket_conferences
  # POST /ticket_conferences.json
  def create
    @ticket_conference = TicketConference.new(ticket_conference_params)

    respond_to do |format|
      if @ticket_conference.save
        format.html { redirect_to @ticket_conference, notice: 'Ticket conference was successfully created.' }
        format.json { render :show, status: :created, location: @ticket_conference }
      else
        format.html { render :new }
        format.json { render json: @ticket_conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ticket_conferences/1
  # PATCH/PUT /ticket_conferences/1.json
  def update
    respond_to do |format|
      if @ticket_conference.update(ticket_conference_params)
        format.html { redirect_to @ticket_conference, notice: 'Ticket conference was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket_conference }
      else
        format.html { render :edit }
        format.json { render json: @ticket_conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ticket_conferences/1
  # DELETE /ticket_conferences/1.json
  def destroy
    @ticket_conference.destroy
    respond_to do |format|
      format.html { redirect_to ticket_conferences_url, notice: 'Ticket conference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket_conference
      @ticket_conference = TicketConference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_conference_params
      params.require(:ticket_conference).permit(:ticketConference_assistance, :Ticket, :Conference)
    end
end
