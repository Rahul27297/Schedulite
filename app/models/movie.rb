class Movie < ActiveRecord::Base
  
    @@all_departments = ['All', 'Computer Science', 'Chemical Engineering']
    @@all_requirements = ['Major Core', 'General Technical Requirement', 'General Technical Elective', 'Track Course']
    @requirements_to_show = []
    @department_to_show = ''
    
    def self.all_departments
        return @@all_departments
    end
    
    def self.all_requirements
        return @@all_requirements
    end
    
    def self.requirements_to_show
        return @requirements_to_show
    end
    
    def self.department_to_show
        return @department_to_show
    end

    def self.filter_by_params(department, requirements)
        @requirements_to_show = requirements
        @department_to_show = department
        if department == "All"
            Movie.where({requirement: requirements})
        else
            Movie.where({dept: department, requirement: requirements})
        end
    end
end
