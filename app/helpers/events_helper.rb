module EventsHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
    link_to "#{title} &#8645;".html_safe, { sort: column, direction: direction }
  end

  def long_formatted_date_time(date_time)
    date_time.strftime("%d/%m/%Y %H:%M")
  rescue StandardError => e
    "Fecha no válida"
  end
end
