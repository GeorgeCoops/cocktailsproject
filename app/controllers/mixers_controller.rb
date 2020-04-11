class MixersController < ApplicationController

    def index
        @mixers = Mixer.all
    end

    def show
        @mixer = Mixer.find(params[:id])
    end



end
