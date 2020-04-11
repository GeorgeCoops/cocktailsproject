class AlcoholsController < ApplicationController

    def index
        @alcohols = Alcohol.all
    end

    def show
        @alcohol = Alcohol.find(params[:id])
    end
 
end
