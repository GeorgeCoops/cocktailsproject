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
        @cocktail.user = current_user 
        if @cocktail.valid?

        @cocktail.save
        redirect_to @cocktail
        else 
          
            flash.now[:errors] << @cocktail.errors.full_messages

            flash.now[:errors] << @cocktail.mixers.map{ |mixer| mixer.errors ? mixer.errors.full_messages : nil}
            flash.now[:errors] << @cocktail.alcohols.map{ |alcohol| alcohol.errors ? alcohol.errors.full_messages : nil}
            flash.now[:errors] << @cocktail.garnishes.map{ |garnish| garnish.errors ? garnish.errors.full_messages : nil}
            flash.now[:errors] = flash.now[:errors].flatten
          
            render :_form
        end 
  
    end

    def edit 
        @cocktail = Cocktail.find(params[:id])
    end

    def update 
    @cocktail = Cocktail.find(params[:id])

    @cocktail.update(cocktail_params)
        if @cocktail.valid?

            @cocktail.save
            redirect_to @cocktail
        else 
                
            flash.now[:errors] << @cocktail.errors.full_messages

            flash.now[:errors] << @cocktail.mixers.map{ |mixer| mixer.errors ? mixer.errors.full_messages : nil}
            flash.now[:errors] << @cocktail.alcohols.map{ |alcohol| alcohol.errors ? alcohol.errors.full_messages : nil}
            flash.now[:errors] << @cocktail.garnishes.map{ |garnish| garnish.errors ? garnish.errors.full_messages : nil}
            flash.now[:errors] = flash.now[:errors].flatten
            
            render :edit
        end 
    end

    def destroy 
        @cocktail = Cocktail.find(params[:id])
        @cocktail.destroy 
        redirect_to cocktails_path
    end

    private

    def cocktail_params
        params.require(:cocktail).permit(:name, :picture, :calories, :instructions, :description, :difficulty, :user_name, garnish_ids: [], garnishes_attributes: [:name, :edible], mixer_ids: [], mixers_attributes: [:name, :sweet_sour], alcohol_ids: [], alcohols_attributes: [:name, :colour, :alcohol_content])
    end
        
end
