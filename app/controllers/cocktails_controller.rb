class CocktailsController < ApplicationController

    def index
        @cocktails = Cocktail.all
    end

    def show
        @cocktail = Cocktail.find(params[:id])
    end

    def new 
        @cocktail = Cocktail.new 
    end

    def create 

        @cocktail = Cocktail.new(cocktail_params)
        # if @cocktail.valid? 

        @cocktail.save 
      byebug
        redirect_to @cocktail
        
        # end 
        
        # render :new 
    end

    private

    def cocktail_params
        params.require(:cocktail).permit(:name, :calories, :instructions, :description, :difficulty, :user_name, garnish_ids: [], garnishes_attributes: [:name, :edible], mixer_ids: [], mixers_attributes: [:name, :sweet_sour], alcohol_ids: [], alcohols_attributes: [:name, :colour, :alcohol_content])
    end
        
end
