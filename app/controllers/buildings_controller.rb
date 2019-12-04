class BuildingsController < ApplicationController

    def index 
        @buildings = Building.all 
    end 

    def show 
        @building = Building.find(params[:id])
    end 

    def new 
        @building = Building.new 
    end 

    def create 
        @building = Building.create(release_params)

        if @building.save 
            redirect_to @building 
        else 
            render 'new'
        end
    end 

    def edit    
        @building = Building.find(params[:id])
    end 
    

    def update 
        @building = Building.find(params[:id])

        if @building.update(release_params)
            redirect_to @building
        else 
            render 'edit'
        end 
    end 

    def release_params
        params.require(:building).permit(:name, :country, :address, :rent_per_floor, :number_of_floors)
    end 

    def destroy
        @building = Building.find(params[:id])
        @building.destroy 
        redirect_to buildings_path
    end 
end
