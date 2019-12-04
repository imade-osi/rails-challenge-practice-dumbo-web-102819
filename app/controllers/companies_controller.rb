require "byebug"
class CompaniesController < ApplicationController

    def index 
        @companies = Company.all 
    end 

    def show 
        @company = Company.find(params[:id])
    end 
    
    def new 
        @company = Company.new 
    end 

    def create 
        @company = Company.create(release_params)
        redirect_to @company 
    end 

    def edit 
         @company = Company.find(params[:id]) 
    end 

    def update  
        @company = Company.find(params[:id])
        #byebug

        floors_data = params[:company][:offices][:offices]
        current_building_id = Building.first.id
        array_index = 1
        Building.all.each do |building|
            next_building = false
            #byebug
            while(!next_building)
                current_floor = floors_data[array_index]
                test_bool = current_floor == ""
                if test_bool
                    next_building = true
                else
                    Office.create(company_id: @company.id, building_id: building.id, floor: floors_data[array_index])
                end
                array_index += 1
                if array_index > floors_data.count - 1
                    next_building = true
                end
            end
        end


        if  @company.update(release_params)
            redirect_to @company 
            
        else 
            render 'edit'
        end
    end 

    def release_params
        params.require(:company).permit(:name)
    end 
end
