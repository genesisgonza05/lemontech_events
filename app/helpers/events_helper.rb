module EventsHelper
  def long_formatted_date_time(date_time)
    date_time.strftime("%d/%m/%Y %H:%M")
  rescue StandardError => e
    "Fecha no válida"
  end

  def col_size(all = "false")
    all == "true" ? "3" : "4"
  end
end
