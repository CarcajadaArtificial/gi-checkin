class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  # GET /tickets.json
  def index
    @t = Ticket.all
    @c = Conference.all
    @e = Event.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  def esm_875678545678
    @t_total = Ticket.where(:event_id => 2).count
    @t_preregistered = Ticket.where(:ticket_preregistered => true, :event_id => 2).count
    @conferences = Conference.where(:event_id => 2)
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  def createBatch
    if params[:typeId]
     @ticket = Ticket.createTickets(params[:typeId], params[:quantity])
   end
  end

  def preregister2
    @ticket = Ticket.searchReference(params[:param_reference])
  end

  def preregister
    @ticket = Ticket.searchReference(params[:param_reference])
    @jueves  = []
    @viernes = []
    if Ticket.where(:ticket_conference1 => 1).count < 199 then @jueves.push(['Fashion: Andy Benavides', '1']) end
    if Ticket.where(:ticket_conference1 => 2).count < 34 then @jueves.push(['Fashion: CEDIM', '2']) end
    if Ticket.where(:ticket_conference1 => 3).count < 79 then @jueves.push(['Trends: Levadura', '3']) end
    if Ticket.where(:ticket_conference1 => 4).count < 69 then @jueves.push(['Trends: Huntmuse', '4']) end
    if Ticket.where(:ticket_conference1 => 5).count < 34 then @jueves.push(['Sports: Athlete Booster', '5']) end
    if Ticket.where(:ticket_conference1 => 15).count < 34 then @jueves.push(['Sports: CEMEX - Tigres', '15']) end
    if Ticket.where(:ticket_conference1 => 16).count < 64 then @jueves.push(['Sports: Insane Workout Center', '16']) end
    if Ticket.where(:ticket_conference1 => 6).count < 139 then @jueves.push(['Entertainment: Inspiral', '6']) end
    @jueves.push(['No voy a asistir', '14'])
    if Ticket.where(:ticket_conference2 => 7).count < 59 then @viernes.push(['Fashion: Polanna / Givehope', '7']) end
    if Ticket.where(:ticket_conference2 => 8).count < 159 then @viernes.push(['Fashion: Instituto di Moda Burgo', '8']) end
    if Ticket.where(:ticket_conference2 => 9).count < 79 then @viernes.push(['Trends: Ana Tere Canales', '9']) end
    if Ticket.where(:ticket_conference2 => 10).count < 109 then @viernes.push(['Trends: Taste n Tell', '10']) end
    if Ticket.where(:ticket_conference2 => 11).count < 34 then @viernes.push(['Sports: Abierto GNP Seguros', '11']) end
    if Ticket.where(:ticket_conference2 => 12).count < 69 then @viernes.push(['Entertainment: La Sociedad', '12']) end
    if Ticket.where(:ticket_conference2 => 13).count < 69 then @viernes.push(['Entertainment: Nebulosa', '13']) end
    @viernes.push(['No voy a asistir', '14'])
  end

  def register
    if params[:paramT] != ""
      ticket = Ticket.where(:ticket_reference => params[:paramT]).first
      @ticket = ticket
      #event = Event.find(current_user.event_id)
      event = Event.find(2)
      @reg = Ticket.search(ticket, nil, event)
    end
  end

  def register_conference
    if params[:paramT] != nil && params[:paramC] != nil && params[:paramC] != "" && params[:paramT] != ""

      @ticket = Ticket.where(:ticket_reference => params[:paramT].upcase).first
      conference = Conference.find(params[:paramC]) #AQUI PONER ID DE CONFERENCE
      # event = Event.find(current_user.event_id)
      event = Event.find(2) # Cambiar a 2 para ESM
      if conference && @ticket

        if @ticket.conferences.exists?(conference.id)
          if TicketConference.where(:ticket_id => @ticket.id, :conference_id => params[:paramC]).first.TicketConference_assistance == true
            #Nada
          else
            TicketConference.where(:ticket_id => @ticket.id, :conference_id => params[:paramC]).update(:TicketConference_assistance => true)
            conference.conference_attendance = conference.conference_attendance + 1
            conference.save
          end
        else
          TicketConference.create(:ticket_id => @ticket.id, :conference_id => params[:paramC], :TicketConference_assistance => true)
          conference.conference_attendance = conference.conference_attendance + 1
          conference.save
        end

        @conf = 1

      end
    end
  end

  def confirmation

  end

  # GET /tickets/1/edit
  def edit

  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    error = ""
    if @ticket.event_id ==1
      if ticket_params[:ticket_conference1] == "" || ticket_params[:ticket_conference2]== "" || ticket_params[:ticket_conference1] == nil || ticket_params[:ticket_conference2]== nil
        error = "Porfavor elige dos talleres."
        redirect_to preregister_tickets_path(param_reference: @ticket.ticket_reference,param_error: 4), notice: error
        return
      end
    elsif @ticket.event_id ==2
      if params[:params_conferencia1]
        puts "HOLA"
      end
      puts
      case @ticket.ticket_ticketTypeId
      when 1
        incluidas = [true, true, true]
      when 2
        incluidas = [false, true, false]
      when 3
        incluidas = [false, false, false]
      when 4
        incluidas = [false, false, false]
      end

      magistrales = [params[:params_conferencia1], params[:params_conferencia2], params[:params_conferencia3]]
      mag_count = 0
      for magistral in magistrales
        if magistral
          mag_count += 1
        end
      end
      puts mag_count
      experiencias = [params[:params_experiencia1], params[:params_experiencia2], params[:params_experiencia3], params[:params_experiencia4], params[:params_experiencia5], params[:params_experiencia6], params[:params_experiencia7], params[:params_experiencia8], params[:params_experiencia9]]
      exp_count = 0
      for experiencia in experiencias
        if experiencia
          exp_count += 1
        end
      end

      puts exp_count
      if experiencias[3] && experiencias[4]
        error = "No puedes inscribir la Experiencia de Marca por anunciar a las 10:00 am y la Experiencia de Marca por anunciar a las 11:30 am"
        puts error
        @ticket.ticket_preregistered = false
        redirect_to preregister2_tickets_path(param_reference: @ticket.ticket_reference,param_error: 1), notice: error
        return
      end
      if exp_count > 6
        error = "No puedes inscribir más de 6 Experiencias de Marca"
        puts error
        @ticket.ticket_preregistered = false
        redirect_to preregister2_tickets_path(param_reference: @ticket.ticket_reference,param_error: 2), notice: error
        return
      end
      # if @ticket.ticket_ticketTypeId == 4 && exp_count > 2
      #   error = "No puedes inscribir más de 2 Experiencias de Marca"
      #   puts error
      #   @ticket.ticket_preregistered = false
      #   redirect_to preregister2_tickets_path(param_reference: @ticket.ticket_reference,param_error: 3), notice: error
      #   return
      # end
      conferencias =[incluidas, magistrales, experiencias]
      puts conferencias
      if error ==""
        incluidas.each_with_index do |value, index|
          if value != nil
            a = TicketConference.new
            a.ticket_id = @ticket.id
            a.conference_id = index +1
            a.save
          end
        end

        magistrales.each_with_index do |value, index|
          if value != nil
            a = TicketConference.new
            a.ticket_id = @ticket.id
            a.conference_id = index +4
            a.save
          end
        end

        experiencias.each_with_index do |value, index|
          if value != nil
            a = TicketConference.new
            a.ticket_id = @ticket.id
            a.conference_id = index +7
            a.save
          end
        end
        if experiencias[9]
          a = TicketConference.new
          a.ticket_id = @ticket
          a.conference_id = 27
          a.save
        end

        taller = TicketConference.new
        taller.ticket_id = @ticket.id
        taller.conference_id = ticket_params[:ticket_conference1]
        taller.save
        speed = TicketConference.new
        speed.ticket_id = @ticket.id
        speed.conference_id = ticket_params[:ticket_conference2]
        speed.save
      end
    end

    respond_to do |format|
      if @ticket.update(ticket_params)
        TicketMailer.preregister_email(@ticket).deliver_later
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:ticket_reference, :ticket_ticketTypeId, :ticket_name, :ticket_schoolId, :ticket_email, :ticket_sex, :ticket_age, :ticket_course, :ticket_semester, :ticket_other, :ticket_badgeNumber, :ticket_registered, :ticket_preregistered, :ticket_conference1, :ticket_conference2, :event_id)
    end
end
