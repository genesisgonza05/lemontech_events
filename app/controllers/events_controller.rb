class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_event, only: %i[ show edit update destroy ]

  # GET /events
  def index
    @q = current_user.events_ordered_with_ransack(params[:sort], params[:direction], params[:q])
    @events = @q.result(distinct: true).page(params[:page]).per(Event::PER_PAGE)

    respond_to do |format|
      format.html
      format.turbo_stream
      format.js
    end
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = current_user.events.build
  end

  # GET /events/1/edit
  def edit
    @view = params[:view] || "list"
    @back_path = @view == "show" ? event_path(@event) : events_path
  end

  # POST /events or /events.json
  def create
    @event = current_user.events.build(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: I18n.t('controllers.events.created.success') }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: I18n.t('controllers.events.updated.success') }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy!
    respond_to do |format|
      format.html { redirect_to events_url, notice: I18n.t('controllers.events.destroyed.success') }
      format.json { head :no_content }
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :event_date_time, :location, :capacity, :requirements, :user_id)
  end

  def check_user_event
    @event = current_user.events.find_by(id: params[:id])
    redirect_to events_path, notice: I18n.t('controllers.events.manage.not_auth') if @event.nil?
  end
end
