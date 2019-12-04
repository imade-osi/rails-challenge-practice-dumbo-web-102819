class Company < ApplicationRecord
    has_many :offices, dependent: :destroy
    has_many :buildings, through: :offices 
    has_many :employees, dependent: :destroy


    # def company_offices
    #     Office.all.each do |company_office|
    #     company_office.company = self 
    #     end     
    # end 

    # def company_buildings
    #     company_offices.map do |company_building|
    #     company_building.building
    #     end 
    # end 
end
