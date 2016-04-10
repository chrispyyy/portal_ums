module ApplicationHelper
  
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge({:sort => column, :direction => direction, :page => 1})
  end

  def title(page_title)
    content_for :title, page_title.to_s
  end
  
  def admin?
    controller.class.name.split("::").first=="Admin"
  end

  def short_cohort_desc(cohort)
    "#{short_program_desc(cohort.program)} #{cohort.starts_on.to_s(:short_friendly)}"
  end

  def short_program_desc(program)
    return nil unless program
    commitment = program.part_time? ? 'P/T' : 'F/T'
    "#{program.city.first(3)} #{program.short_name.first(3)} #{commitment}"
  end
  
end
