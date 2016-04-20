class Admin::LocalesController < ApplicationController

  include SortedColumns

  before_action :require_locale, only: [:show, :edit, :update, :destroy]
  before_action :prep_form

  def new
    @locale = Locale.new
  end

  def create
    @locale = Locale.new(locale_params)
    if @locale.save
      redirect_to admin_locales_path, notice: "#{@locale.full_name} was successfully created"
    else
      prep_form
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

  def require_locale
    @locale = Locale.find(params[:id])
  end

  def prep_form
    @fellow = Fellow.all
  end
  #
  # def require_locale
  #   @locale = @cohort.fellows.locales.find(params[:id])
  # end

end
