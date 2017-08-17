class TicketTypeConferencesController < ApplicationController
  before_action :set_ticket_type_conference, only: [:show, :edit, :update, :destroy]

  # GET /ticket_type_conferences
  # GET /ticket_type_conferences.json
  def index
    @ticket_type_conferences = TicketTypeConference.all
  end

  # GET /ticket_type_conferences/1
  # GET /ticket_type_conferences/1.json
  def show
  end

  # GET /ticket_type_conferences/new
  def new
    @ticket_type_conference = TicketTypeConference.new
  end

  # GET /ticket_type_conferences/1/edit
  def edit
  end

  # POST /ticket_type_conferences
  # POST /ticket_type_conferences.json
  def create
    @ticket_type_conference = TicketTypeConference.new(ticket_type_conference_params)

    respond_to do |format|
      if @ticket_type_conference.save
        format.html { redirect_to @ticket_type_conference, notice: 'Ticket type conference was successfully created.' }
        format.json { render :show, status: :created, location: @ticket_type_conference }
      else
        format.html { render :new }
        format.json { render json: @ticket_type_conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ticket_type_conferences/1
  # PATCH/PUT /ticket_type_conferences/1.json
  def update
    respond_to do |format|
      if @ticket_type_conference.update(ticket_type_conference_params)
        format.html { redirect_to @ticket_type_conference, notice: 'Ticket type conference was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket_type_conference }
      else
        format.html { render :edit }
        format.json { render json: @ticket_type_conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ticket_type_conferences/1
  # DELETE /ticket_type_conferences/1.json
  def destroy
    @ticket_type_conference.destroy
    respond_to do |format|
      format.html { redirect_to ticket_type_conferences_url, notice: 'Ticket type conference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket_type_conference
      @ticket_type_conference = TicketTypeConference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_type_conference_params
      params.require(:ticket_type_conference).permit(:Ticket_Type_id, :Conference_id)
    end
end
