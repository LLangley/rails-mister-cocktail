class DosesController < ApplicationController

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    ingredient = Ingredient.find(params[:doses][:ingredient])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.ingredient = ingredient
    if @dose.save
      redirect_to cocktails_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    dose = Dose.find(params[:id])
    cocktail = dose.cocktail
    dose.destroy
    redirect_to cocktail_path(cocktail)
  end


  private


  def dose_params
    params.require(:dose).permit(:description)
  end

end
