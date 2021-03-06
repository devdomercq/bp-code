class ScoreboardsController < ApplicationController
    before_action :find_scoreboard, only: [:show, :edit, :update, :destroy]
    
    def index
        
        if !params[:category].blank?
            @category_id = Category.find_by(name: params[:category]).id
            @scoreboards = Scoreboard.where(:category_id => @category_id).order("eventdate DESC").page(params[:page]).per(9)
            
        elsif params[:search]
            @scoreboards = Scoreboard.search(params[:search]).order("eventdate DESC").page(params[:page]).per(9)
        else
            @scoreboards = Scoreboard.all.order("eventdate DESC").page(params[:page]).per(9)

  
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
            @categories = Category.all.map{ |c| [c.name, c.id] }
            render 'new'
        end
    end
    
    
    def edit
        @categories = Category.all.map{ |c| [c.name, c.id] }
        
    end
    
    def update
        @scoreboard.category_id = params[:category_id]
        @categories = Category.all.map{ |c| [c.name, c.id] }
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
    
    def listview
        
        @scoreboards = Scoreboard.order("eventdate DESC").page(params[:page])
    end
    
    
    private
    
    def scoreboard_params
        params.require(:scoreboard).permit(:bpecode, :organization, :code, :description, :category_id, :scoreboard_img, :eventdate)
    end
    
    def find_scoreboard 
        @scoreboard = Scoreboard.find(params[:id])
    end
    
end


