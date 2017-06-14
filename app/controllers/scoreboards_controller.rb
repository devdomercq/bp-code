class ScoreboardsController < ApplicationController
    before_action :find_scoreboard, only: [:show, :edit, :update, :destroy]
    
    def index
        @scoreboards = Scoreboard.all.order("created_at DESC")
    end
    
    def show
        
    end
    
    def new
        @scoreboard = current_user.scoreboards.build
    end
    
    def create
         @scoreboard = current_user.scoreboards.build(scoreboard_params)
        
        if @scoreboard.save
            redirect_to root_path
        else
            render 'new'
        end
    end
    
    
    def edit
        
    end
    
    def update
        if @scoreboard.update(scoreboard_params)
            redirect_to scoreboard_path(@scoreboard)
        else
            render 'edit'
        end
    end
    
    def destroy
        @scoreboard.destroy
        redirect_to root_path
    end
    
    
    
    private
    
    def scoreboard_params
        params.require(:scoreboard).permit(:bpecode, :organization, :code, :description)
    end
    
    def find_scoreboard 
        @scoreboard = Scoreboard.find(params[:id])
    end
    
end
