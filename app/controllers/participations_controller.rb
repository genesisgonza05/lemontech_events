class ParticipationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    @participation = @event.participations.build(user: current_user)

    respond_to do |format|
      if @participation.save
        format.js
        format.html { redirect_to events_path(all: true), notice: "Te has registrado en el evento exitosamente." }
      else
        format.js { render 'create_error' }
        format.html { redirect_to events_path(all: true), alert: "No puedes registrarte dos veces en el mismo evento." }
      end
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @participation = @event.participations.find_by(user: current_user)
    respond_to do |format|
      if @participation
        @participation.destroy
        format.js
        format.html { redirect_to events_path(all: true), notice: "Has cancelado tu registro en el evento." }
      else
        format.js { render 'destroy_error' }
        format.html { redirect_to events_path(all: true), alert: "No estás registrado en este evento." }
      end
    end
  end
end
