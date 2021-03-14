class CoursesController < ApplicationController
    
    def show
        id = params[:id] # retrieve movie ID from URI route
        @course = Course.find(id) # look up course by unique ID
        @coursedetail = Coursedetails.find_by(number: @course.course_num)  
    end
    
    def index
        @all_departments = Course.all_departments 
        @all_requirements = Course.all_requirements

        if params.has_key?(:requirements)
            @query_requirements = params[:requirements]
        else
            @query_requirements = Hash[@all_requirements.map {|x| [x, 1]}]
        end
        
        if params.has_key?(:department)
            @department = (params[:department])
        else
            @department = "All"
        end

        @courses = Course.filter_by_params(@department, @query_requirements.keys)
        @requirements_to_show = Course.requirements_to_show
        @department_to_show = Course.department_to_show
        if !(params.has_key?(:requirements))
            @requirements_to_show = []
        end
    end
    
end