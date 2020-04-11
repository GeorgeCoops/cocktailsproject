class GarnishesController < ApplicationController
    def index
        @garnishes = Garnish.all 
    end

    def show
        @garnish = Garnish.find(params[:id])
    end

end
