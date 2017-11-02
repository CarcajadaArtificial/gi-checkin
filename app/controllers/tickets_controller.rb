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

  def mkt_dashboard

  end

  def impulso_dashboard
    @event = 3
    if current_user
        if current_user.event_id == 3
          @event = 3
        else
          sign_out current_user
          redirect_to new_user_session_path
        end
    else
    redirect_to new_user_session_path
    end
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

  def preregister
    @ticket = Ticket.searchReference(params[:param_reference],1)
    @jueves  = []
    @viernes = []
#CERRADO 10/11    if Ticket.where(:ticket_conference1 => 1).count < 199 then @jueves.push(['Fashion: Andy Benavides', '1']) end
    if Ticket.where(:ticket_conference1 => 2, :event_id => 1).count < 34 then @jueves.push(['Fashion: LCI Monterrey', '2']) end
    if Ticket.where(:ticket_conference1 => 3, :event_id => 1).count < 79 then @jueves.push(['Trends: Levadura', '3']) end
    if Ticket.where(:ticket_conference1 => 4, :event_id => 1).count < 69 then @jueves.push(['Trends: Huntmuse', '4']) end
    if Ticket.where(:ticket_conference1 => 5, :event_id => 1).count < 34 then @jueves.push(['Sports: Athlete Booster', '5']) end
    if Ticket.where(:ticket_conference1 => 15, :event_id => 1).count < 34 then @jueves.push(['Sports: CEMEX - Tigres', '15']) end
    if Ticket.where(:ticket_conference1 => 16, :event_id => 1).count < 64 then @jueves.push(['Sports: Insane Workout Center', '16']) end
    if Ticket.where(:ticket_conference1 => 6, :event_id => 1).count < 139 then @jueves.push(['Entertainment: Inspiral', '6']) end
    @jueves.push(['No voy a asistir', '14'])
    if Ticket.where(:ticket_conference2 => 7, :event_id => 1).count < 74 then @viernes.push(['Fashion: Polanna / Givehope', '7']) end
    if Ticket.where(:ticket_conference2 => 8, :event_id => 1).count < 159 then @viernes.push(['Fashion: Instituto di Moda Burgo', '8']) end
    if Ticket.where(:ticket_conference2 => 9, :event_id => 1).count < 79 then @viernes.push(['Trends: Ana Tere Canales', '9']) end
    if Ticket.where(:ticket_conference2 => 10, :event_id => 1).count < 114 then @viernes.push(['Trends: Taste n Tell', '10']) end
    if Ticket.where(:ticket_conference2 => 11, :event_id => 1).count < 79 then @viernes.push(['Sports: Abierto GNP Seguros', '11']) end
    if Ticket.where(:ticket_conference2 => 12, :event_id => 1).count < 69 then @viernes.push(['Entertainment: La Sociedad', '12']) end
    if Ticket.where(:ticket_conference2 => 13, :event_id => 1).count < 79 then @viernes.push(['Entertainment: Nebulosa', '13']) end
    @viernes.push(['No voy a asistir', '14'])
  end

  def preregister2
    @ticket = Ticket.searchReference(params[:param_reference],2)
  end

  def impulso
    event = 3
    @ticket = Ticket.searchReference(params[:param_reference],event)
    @talleres  = []
    @visitas = []
    if (Ticket.where(:ticket_conference1 => 1, :event_id => event).count + Ticket.where(:ticket_conference2 => 1, :event_id => event).count) < 16 then
       @talleres.push(['Jueves 9:30-11:30 - FEM', '1']) end
    if (Ticket.where(:ticket_conference1 => 2, :event_id => event).count + Ticket.where(:ticket_conference2 => 2, :event_id => event).count) < 9 then
       @talleres.push(['Jueves 11:00-12:30 - FLOW', '2']) end
    if (Ticket.where(:ticket_conference1 => 3, :event_id => event).count + Ticket.where(:ticket_conference2 => 3, :event_id => event).count) < 16 then
       @talleres.push(['Jueves 11:30-13:30 - Solid', '3']) end
    if (Ticket.where(:ticket_conference1 => 4, :event_id => event).count + Ticket.where(:ticket_conference2 => 4, :event_id => event).count) < 9 then
       @talleres.push(['Jueves 13:30-15:00 - CNC', '4']) end
    if (Ticket.where(:ticket_conference1 => 5, :event_id => event).count + Ticket.where(:ticket_conference2 => 5, :event_id => event).count) < 15 then
       @talleres.push(['Jueves 13:30-15:00 - Nx', '5']) end
    if (Ticket.where(:ticket_conference1 => 6, :event_id => event).count + Ticket.where(:ticket_conference2 => 6, :event_id => event).count) < 15 then
       @talleres.push(['Jueves 15:00-17:30 - Nx', '6']) end
    if (Ticket.where(:ticket_conference1 => 7, :event_id => event).count + Ticket.where(:ticket_conference2 => 7, :event_id => event).count) < 9 then
       @talleres.push(['Jueves 17:30-18:30 - Tratamientos térmicos', '7']) end
    if (Ticket.where(:ticket_conference1 => 8, :event_id => event).count + Ticket.where(:ticket_conference2 => 8, :event_id => event).count) < 9 then
       @talleres.push(['Jueves 17:30-18:30 - Pruebas de tensión', '8']) end
    if (Ticket.where(:ticket_conference1 => 9, :event_id => event).count + Ticket.where(:ticket_conference2 => 9, :event_id => event).count) < 16 then
       @talleres.push(['Viernes 9:30-11:30 - Dibujo computarizado con Solid Works', '9']) end
    if (Ticket.where(:ticket_conference1 => 10, :event_id => event).count + Ticket.where(:ticket_conference2 => 10, :event_id => event).count) < 16 then
       @talleres.push(['Viernes 11:30-13:30 - Dibujo computarizado con NX', '10']) end
    if (Ticket.where(:ticket_conference1 => 11, :event_id => event).count + Ticket.where(:ticket_conference2 => 11, :event_id => event).count) < 19 then
       @talleres.push(['Viernes 12:00-13:00 - Impresión 3D', '11']) end
    if (Ticket.where(:ticket_conference1 => 12, :event_id => event).count + Ticket.where(:ticket_conference2 => 12, :event_id => event).count) < 10 then
       @talleres.push(['Viernes 13:30-15:00 - FLOW', '12']) end
    if (Ticket.where(:ticket_conference1 => 13, :event_id => event).count + Ticket.where(:ticket_conference2 => 13, :event_id => event).count) < 9 then
       @talleres.push(['Viernes 13:30-15:00 - Tratamientos térmicos', '13']) end
    if (Ticket.where(:ticket_conference1 => 14, :event_id => event).count + Ticket.where(:ticket_conference2 => 14, :event_id => event).count) < 9 then
       @talleres.push(['Viernes 14:00-15:30 - CNC', '14']) end
    if (Ticket.where(:ticket_conference1 => 15, :event_id => event).count + Ticket.where(:ticket_conference2 => 15, :event_id => event).count) < 20 then
       @talleres.push(['Viernes 13:30-15:00 - Prototipado', '15']) end
    if (Ticket.where(:ticket_conference1 => 16, :event_id => event).count + Ticket.where(:ticket_conference2 => 16, :event_id => event).count) < 16 then
       @talleres.push(['Viernes 15:00-17:00 - Solid', '16']) end
    if (Ticket.where(:ticket_conference1 => 17, :event_id => event).count + Ticket.where(:ticket_conference2 => 17, :event_id => event).count) < 15 then
       @talleres.push(['Viernes 17:00-19:30 - FEM ALFR', '17']) end
    if (Ticket.where(:ticket_conference1 => 33, :event_id => event).count + Ticket.where(:ticket_conference2 => 33, :event_id => event).count) < 17 then
       @talleres.push(['Jueves 11:00-12:30 - Nx', '33']) end
    if (Ticket.where(:ticket_conference1 => 34, :event_id => event).count + Ticket.where(:ticket_conference2 => 34, :event_id => event).count) < 4 then
       @talleres.push(['Jueves 11:00-12:30 - Apps iPhone (Mac iOS requerido)', '34']) end
    if (Ticket.where(:ticket_conference1 => 35, :event_id => event).count + Ticket.where(:ticket_conference2 => 35, :event_id => event).count) < 18 then
       @talleres.push(['Jueves 13:30-15:30 - Solid', '35']) end
    if (Ticket.where(:ticket_conference1 => 36, :event_id => event).count + Ticket.where(:ticket_conference2 => 36, :event_id => event).count) < 18 then
       @talleres.push(['Jueves 17:30-19:30 - Nx', '36']) end
    if (Ticket.where(:ticket_conference1 => 37, :event_id => event).count + Ticket.where(:ticket_conference2 => 37, :event_id => event).count) < 18 then
       @talleres.push(['Viernes 9:30-11:30 - Nx', '37']) end
    if (Ticket.where(:ticket_conference1 => 38, :event_id => event).count + Ticket.where(:ticket_conference2 => 38, :event_id => event).count) < 18 then
       @talleres.push(['Viernes 12:30-14:30 - Solid', '38']) end
    if (Ticket.where(:ticket_conference1 => 39, :event_id => event).count + Ticket.where(:ticket_conference2 => 39, :event_id => event).count) < 18 then
       @talleres.push(['Viernes 14:30-16:30 - Nx', '39']) end
    if (Ticket.where(:ticket_conference1 => 40, :event_id => event).count + Ticket.where(:ticket_conference2 => 40, :event_id => event).count) < 25 then
       @talleres.push(['Viernes 15:30-17:30 - Mecánica Maker', '40']) end
    if (Ticket.where(:ticket_conference1 => 41, :event_id => event).count + Ticket.where(:ticket_conference2 => 41, :event_id => event).count) < 18 then
       @talleres.push(['Viernes 16:30-18:30 - Solid', '41']) end
    if (Ticket.where(:ticket_conference1 => 44, :event_id => event).count + Ticket.where(:ticket_conference2 => 44, :event_id => event).count) < 12 then
        @talleres.push(['Jueves 16:00-17:30 - Metrología', '44']) end

    if Ticket.where(:ticket_other => 30, :event_id => event).or(Ticket.where(:ticket_conference2 => 30, :event_id => event)).count < 35 then
      @visitas.push(['Jueves 8:00-12:00 - Spirax Arco', '30']) end
    if Ticket.where(:ticket_other => 18, :event_id => event).or(Ticket.where(:ticket_conference2 => 18, :event_id => event)).count < 35 then
      @visitas.push(['Jueves 11:00-15:00  - COCA-COLA', '18']) end
    if Ticket.where(:ticket_other => 19, :event_id => event).or(Ticket.where(:ticket_conference2 => 19, :event_id => event)).count < 25 then
      @visitas.push(['Jueves 11:00-15:00  - Ternium México', '19']) end
    if Ticket.where(:ticket_other => 20, :event_id => event).or(Ticket.where(:ticket_conference2 => 20, :event_id => event)).count < 35 then
      @visitas.push(['Jueves 8:30-13:30  - Next Energy', '20']) end
    if Ticket.where(:ticket_other => 21, :event_id => event).or(Ticket.where(:ticket_conference2 => 21, :event_id => event)).count < 25 then
      @visitas.push(['Jueves 8:30-12:00  - Villacero', '21']) end
    # Cerrado 1/11 if Ticket.where(:ticket_other => 32, :event_id => event).or(Ticket.where(:ticket_conference2 => 32, :event_id => event)).count < 20 then
    #  @visitas.push(['Jueves 10:00  - Owens- Illinois', '32']) end
    # Cerrado 1/11 if Ticket.where(:ticket_other => 42, :event_id => event).or(Ticket.where(:ticket_conference2 => 42, :event_id => event)).count < 17 then
    #  @visitas.push(['Jueves 10:00  - Nemak', '42']) end
    # Cerrado 1/11 if Ticket.where(:ticket_other => 43, :event_id => event).or(Ticket.where(:ticket_conference2 => 43, :event_id => event)).count < 17 then
    #  @visitas.push(['Jueves 10:00  - Nemak', '43']) end
#Cerrado 28/10    if Ticket.where(:ticket_other => 22, :event_id => event).or(Ticket.where(:ticket_conference2 => 22, :event_id => event)).count < 34 then
#      @visitas.push(['Jueves 9:00-13:00  - VIAKON Conductores Eléctricos', '22']) end
    if Ticket.where(:ticket_other => 23, :event_id => event).or(Ticket.where(:ticket_conference2 => 23, :event_id => event)).count < 35 then
      @visitas.push(['Jueves 14:00-18:00  - VIAKON Conductores Eléctricos', '23']) end
#Cerrado 24/10    if Ticket.where(:ticket_other => 24, :event_id => event).or(Ticket.where(:ticket_conference2 => 24, :event_id => event)).count < 14 then
#      @visitas.push(['Viernes 8:00-12:00  - FRISA', '24']) end
    if Ticket.where(:ticket_other => 25, :event_id => event).or(Ticket.where(:ticket_conference2 => 25, :event_id => event)).count < 35 then
      @visitas.push(['Viernes 8:30-13:30  - Industrias John Deere', '25']) end
    if Ticket.where(:ticket_other => 26, :event_id => event).or(Ticket.where(:ticket_conference2 => 26, :event_id => event)).count < 30 then
      @visitas.push(['Viernes 8:30-13:30  - Vitro', '26']) end
    if Ticket.where(:ticket_other => 27, :event_id => event).or(Ticket.where(:ticket_conference2 => 27, :event_id => event)).count < 35 then
      @visitas.push(['Viernes 9:30-14:00  - Ingersoll Rand', '27']) end
    if Ticket.where(:ticket_other => 28, :event_id => event).or(Ticket.where(:ticket_conference2 => 28, :event_id => event)).count < 35 then
      @visitas.push(['Viernes 12:00-15:00  - Cervecería Cuauhtémoc', '28']) end
    if Ticket.where(:ticket_other => 29, :event_id => event).or(Ticket.where(:ticket_conference2 => 29, :event_id => event)).count < 25 then
      @visitas.push(['Viernes 13:00-17:00  - Ternium México', '29']) end
    if Ticket.where(:ticket_other => 31, :event_id => event).or(Ticket.where(:ticket_conference2 => 31, :event_id => event)).count < 20 then
      @visitas.push(['Viernes 15:00  - Caterpillar', '31']) end
  end

  def edifica
    event = 4
    @ticket = Ticket.searchReference(params[:param_reference],event)
    @jueves  = []
    @viernes = []
    @sabado = []
    #Cambio para que aparezcan
    if Ticket.where(:ticket_conference1 => 1, :event_id => event).count < 35 then @jueves.push(['Visita: Punto Valle 5:00 pm', '1']) end
    if Ticket.where(:ticket_conference1 => 2, :event_id => event).count < 35 then @jueves.push(['Visita: Arboleda 5:30 pm', '2']) end
    if Ticket.where(:ticket_conference1 => 3, :event_id => event).count < 35 then @jueves.push(['Visita: Torre Céntrika Elite 5:30 pm', '3']) end
    if Ticket.where(:ticket_conference1 => 4, :event_id => event).count < 35 then @jueves.push(['Taller: Three: Certificacion Leed y Sustentabilidad 4:30 pm', '4']) end
    if Ticket.where(:ticket_conference1 => 5, :event_id => event).count < 35 then @jueves.push(['Taller: NAPEI: Refuerzo y reestructuración de elementos de concreto 4:30 pm', '5']) end
    if Ticket.where(:ticket_conference1 => 6, :event_id => event).count < 25 then @jueves.push(['Taller: Sketchup 4:30 pm', '6']) end
    if Ticket.where(:ticket_conference1 => 7, :event_id => event).count < 30 then @jueves.push(['Taller: Excel Avanzado 4:30 pm', '7']) end
    if Ticket.where(:ticket_conference1 => 8, :event_id => event).count < 35 then @jueves.push(['Taller: Ecocreto 4:30 pm', '8']) end

    if Ticket.where(:ticket_conference2 => 9, :event_id => event).count < 35 then @viernes.push(['Visita: Condotec 4:45 pm', '9']) end
    if Ticket.where(:ticket_conference2 => 10, :event_id => event).count < 35 then @viernes.push(['Visita: Punto Valle 5:00 pm', '10']) end
    if Ticket.where(:ticket_conference2 => 11, :event_id => event).count < 35 then @viernes.push(['Visita: Arboleda 5:30 pm', '11']) end
    if Ticket.where(:ticket_conference2 => 12, :event_id => event).count < 25 then @viernes.push(['Taller: Vray 4:30 pm', '12']) end
    if Ticket.where(:ticket_conference2 => 13, :event_id => event).count < 35 then @viernes.push(['Taller: BIM 4:30 pm', '13']) end

    if Ticket.where(:ticket_other => 14, :event_id => event).count < 34 then @sabado.push(['Visita: Tulé 9:00 am', '14']) end
    if Ticket.where(:ticket_other => 15, :event_id => event).count < 30 then @sabado.push(['Visita: Tulé 8:00 am', '15']) end
    if Ticket.where(:ticket_other => 16, :event_id => event).count < 30 then @sabado.push(['Visita: Paseo Cumbres 8:30 am', '16']) end
    if Ticket.where(:ticket_other => 17, :event_id => event).count < 30 then @sabado.push(['Visita: Torres Obispado 8:30 am', '17']) end

  end

  def register
    event = 3
    if params[:paramT] != ""
      ticket = Ticket.where(:ticket_reference => params[:paramT]).first
      @ticket = ticket
      if ticket
        @registered  = Ticket.where(:event_id => event, :ticket_registered => true).count
        @preregistered = Ticket.where(:event_id => event, :ticket_preregistered => true).count
        talleres = [['Jueves 9:30-11:30 - FEM', '1'], ['Jueves 11:00-12:30 - FLOW', '2'], ['Jueves 11:30-13:30 - Solid', '3'], ['Jueves 13:30-15:00 - CNC', '4'], ['Jueves 13:30-15:00 - Nx', '5'], ['Jueves 15:00-17:30 - Nx', '6'], ['Jueves 17:30-18:30 - Tratamientos térmicos', '7'], ['Jueves 17:30-18:30 - Pruebas de tensión', '8'], ['Viernes 9:30-11:30 - Dibujo computarizado con Solid Works', '9'], ['Viernes 11:30-13:30 - Dibujo computarizado con NX', '10'], ['Viernes 12:00-13:00 - Impresión 3D', '11'], ['Viernes 13:30-15:00 - FLOW', '12'], ['Viernes 13:30-15:00 - Tratamientos térmicos', '13'], ['Viernes 14:00-15:30 - CNC', '14'], ['Viernes 13:30-15:00 - Prototipado', '15'], ['Viernes 15:00-17:00 - Solid', '16'], ['Viernes 17:00-19:30 - FEM ALFR', '17'], ['Jueves 11:00-12:30 - Nx', '33'], ['Jueves 11:00-12:30 - Apps iPhone (Mac iOS requerido', '34'], ['Jueves 13:30-15:30 - Solid', '35'], ['Jueves 17:30-19:30 - Nx', '36'], ['Viernes 9:30-11:30 - Nx', '37'], ['Viernes 12:30-14:30 - Solid', '38'], ['Viernes 14:30-16:30 - Nx', '39'], ['Viernes 15:30-17:30 - Mecánica Maker', '40'], ['Viernes 16:30-18:30 - Solid', '41'], ['Jueves 16:00-17:30 - Metrología', '44'], ['Jueves 8:00-12:00 - Spirax Arco', '30'],  ['Jueves 11:00-15:00  - COCA-COLA', '18'],  ['Jueves 11:00-15:00  - Ternium México', '19'],  ['Jueves 8:30-13:30  - Next Energy', '20'],  ['Jueves 8:30-12:00  - Villacero', '21'],  ['Jueves 10:00  - Owens- Illinois', '32'],  ['Jueves 14:00-18:00  - VIAKON Conductores Eléctricos', '23'],  ['Viernes 8:30-13:30  - Industrias John Deere', '25'],  ['Viernes 8:30-13:30  - Vitro', '26'],  ['Viernes 9:30-14:00  - Ingersoll Rand', '27'],  ['Viernes 12:00-15:00  - Cervecería Cuauhtémoc', '28'],  ['Viernes 13:00-17:00  - Ternium México', '29'],  ['Viernes 15:00  - Caterpillar', '31']]
        talleres.each do |t|
          if t[1]== ticket.ticket_conference1
            @taller1 = t[0]
          elsif t[1]== ticket.ticket_conference2
            @taller2 = t[0]
          elsif t[1]== ticket.ticket_other
            @taller3 = t[0]
          end
        end
        @reg = Ticket.search(ticket, nil, event )
      end
    end
  end

  def register_conference
    if params[:paramT] != nil && params[:paramC] != nil && params[:paramC] != "" && params[:paramT] != ""
      event = 3
      @registered =0
      @ticket = Ticket.where(:ticket_reference => params[:paramT]).first
      conference = Conference.where(:event_id => event, :conference_speaker => params[:paramC]).first
      if conference && @ticket
        if @ticket.conferences.exists?(conference.id)
          if TicketConference.where(:ticket_id => @ticket.id, :conference_id => conference.id).first.TicketConference_assistance == true
            @registered = TicketConference.where(:conference_id => conference.id).count
            @conf =1
          else
            TicketConference.where(:ticket_id => @ticket.id, :conference_id => conference.id).update(:TicketConference_assistance => true)
            @registered = TicketConference.where(:conference_id => conference.id).count
            @conf =1
          end
        else
          TicketConference.create(:ticket_id => @ticket.id, :conference_id => conference.id, :TicketConference_assistance => true)
          @registered = TicketConference.where(:conference_id => conference.id).count
          @conf =1
        end
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
