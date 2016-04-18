class Admin::LocalesController < ApplicationController

  include SortedColumns

  before_action :require_fellow, only: [:edit, :update, :show, :destroy]



  protected

  def locale_params
    params.require(:locale).permit(
      :city,
      :country,
      :year
    )
  end

  def require_fellow
    @fellow = @cohort.fellows.find(params[:id])
  end

  def require_locale
    @locale = @cohort.fellows.locales.find(params[:id])
  end

end
