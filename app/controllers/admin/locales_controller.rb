class Admin::LocalesController < ApplicationController

  include SortedColumns

  before_action :require_cohort
  before_action :require_fellow, only: [:edit, :update, :show, :destroy]
  before_filter :require_locale, only: [:show, :edit, :update, :destroy]

  def new
    @locale = @fellow.locales.new
  end

  def create
    @locale = @fellow.locales.new(locale_params)
    if @locale.save
      redirect_to edit_admin_cohort_fellow_path(@fellow.cohort, @fellow.id), notice: "You can add a new Location"
    else
      render :new
    end
  end

  protected

  def locale_params
    params.require(:locale).permit(
      :city,
      :country,
      :period,
      :fellow_id
    )
  end

  def require_cohort
    @cohort = Cohort.find params[:cohort_id]
  end

  def require_fellow
    @fellow = @cohort.fellows.find(params[:id])
  end

  def require_locale
    @locale = Locale.find(params[:id])
  end
  #
  # def require_locale
  #   @locale = @cohort.fellows.locales.find(params[:id])
  # end

end
