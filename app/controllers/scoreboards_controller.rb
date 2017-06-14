class ScoreboardsController < ApplicationController
    before_action :find_scoreboard, only: [:show, :edit, :update, :destroy]
    
    def index
        if !params[:category].blank?
            @category_id = Category.find_by(name: params[:category]).id
            @scoreboards = Scoreboard.where(:category_id => @category_id).order("created_at DESC")
        elsif params[:search]
            @scoreboards = Scoreboard.search(params[:search]).order("created_at DESC")
        else
            @scoreboards = Scoreboard.all.order("created_at DESC")

  
        end  
        
    end
    
    def show
        
    end
    
    def new
        @scoreboard = current_user.scoreboards.build
        @categories = Category.all.map{ |c| [c.name, c.id] }
    end
    
    def create
         @scoreboard = current_user.scoreboards.build(scoreboard_params)
         @scoreboard.category_id = params[:category_id]
        
        if @scoreboard.save
            redirect_to root_path
        else
            render 'new'
        end
    end
    
    
    def edit
        @categories = Category.all.map{ |c| [c.name, c.id] }
    end
    
    def update
        @scoreboard.category_id = params[:category_id]
        
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
        params.require(:scoreboard).permit(:bpecode, :organization, :code, :description, :category_id, :scoreboard_img)
    end
    
    def find_scoreboard 
        @scoreboard = Scoreboard.find(params[:id])
    end
    
end
