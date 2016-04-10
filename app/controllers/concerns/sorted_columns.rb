module SortedColumns
  extend ActiveSupport::Concern

  included do
    helper_method :sort_column, :sort_direction
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end
