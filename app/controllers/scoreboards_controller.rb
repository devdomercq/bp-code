class ScoreboardsController < ApplicationController
    
    def index
    end
    
    def new
        @scoreboard = Scoreboard.new
    end
    
    def create
        @scoreboard = Scoreboard.new(scoreboard_params)
    end
    
    private
    
    def scoreboard_params
        params.require(:scoreboard).permit(:bpecode, :organization, :code, :description)
    end
    
end
