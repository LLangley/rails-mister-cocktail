
# CONTROLLER: Operations that can be performed on the data.

# CONTROLLER gives MODEL DATA to the VIEW,
# and interprets user actions such as button clicks.
# The controller depends on the view and the model.
# In some cases, the controller and the view are the same object


class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    cocktail = Cocktail.new(cocktails_params)
    if cocktail.save
      redirect_to cocktails_path(@cocktail)
    else
        render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
