module EventsHelper
  def long_formatted_date_time(date_time)
    date_time.strftime("%d/%m/%Y %H:%M")
  rescue StandardError => e
    "Fecha no válida"
  end

  def sort_column(sort_value)
    %w[event_date_time name location capacity].include?(sort_value) ? sort_value : User::DEFAULT_SORT
  end

  def sort_direction(direction_value)
    %w[asc desc].include?(direction_value) ? direction_value : User::DEFAULT_DIR
  end
end
