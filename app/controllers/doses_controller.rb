class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]

  def new
    set_cocktail
    @dose = Dose.new
  end

  def create
    set_cocktail
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to @cocktail
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
