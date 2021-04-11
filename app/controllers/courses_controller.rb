class CoursesController < ApplicationController
    skip_before_action :authenticate, only: [:logout]
    
    def show
        id = params[:id] # retrieve movie ID from URI route
        @course = Course.find(id) # look up course by unique ID
        @coursedetail = Coursedetails.find_by(number: @course.course_num)
        gather_faqs(@course)
    end

    def gather_faqs(course)
        course_num = course.course_num
        @questions = CourseFaq.where({course_number: course_num})
        @all_questions = []
        @questions.each do |question|
            answer = []
            ans = CourseFaqAn.all
            answer = CourseFaqAn.where({course_number: course_num, question_number: question.id})
            if answer.empty?
                answer = []
            end
            question_ans = {"id" => question.id, "course_number" => course_num, "question" => question.question, "answer" => answer}
            @all_questions.append(question_ans)
        end
    end

    def prevcoursesform
 	# source: http://railscasts.com/episodes/37-simple-search-form?autoplay=true
	@courses = Course.all
        if params.has_key?(:courses)
             @query_courses = params[:courses]
        else
             @query_courses = Hash[@courses.map {|x| [x, 1]}]
        end

        @courses = Course.filter_by_params(@department, @query_courses.keys)
        if !(params.has_key?(:requirements))
         	@courses = Course.all
 	end
	if params[:search]
	 	@courses = Course.where("course_num LIKE ?", "%#{params[:search]}%")
	end
    end

    def searchresults
         if params[:search]
                @courses = Course.where("course_num LIKE ?", "%#{params[:search]}%")
         else
		@courses = Course.all
	 end
    end


    def updatedcourses
 	@requirements_to_show = Course.all_requirements
	@all_departments = Course.all_departments
 	@all_requirements = Course.all_requirements
 	@courses = []
	Course.all.each do |each_course|
		if params[:show_course].nil?
			@courses = Course.all
		else
			if params[:show_course].keys.exclude? each_course.course_num
                        	@courses << each_course
			end
                end
	end
	@addCart = []
    @requirements_to_show = Course.requirements_to_show
    end  
    
    def index
        puts "params are ... #{params}"
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
        @addCart = []
        in_cart = Cart.where({user_id: get_user_id_from_session})
        if in_cart != nil
            in_cart.each do |each_course|
                @addCart << each_course.course_number
            end
        end
    end
    
    def add_faq
        id = params[:id]
        question = params[:inputQuestion]
        course_num = params[:inputCourse]
        @course = Course.find_by(course_num: course_num)
        course_faq = CourseFaq.create(course_number: course_num, question: question)
        faqs = CourseFaq.all
        redirect_to course_detail_path(@course)
    end

    def add_ans
        course_faq_ans = CourseFaqAn.create(question_number: params[:inputQuestionId], answer: params[:inputAnswer], course_number: params[:course_number])
        ans = CourseFaqAn.all
        @course = Course.find_by(course_num: params[:course_number])
        redirect_to course_detail_path(@course)
    end
    
     def add_to_cart
        @overlap = []
        @cartDetails = [] 
        user_id = get_user_id_from_session
        course_time_array = []
        if params[:addCart] != nil
            if params[:addCart].size < 7
                cart = params[:addCart]
                Cart.where(user_id: user_id).delete_all
                cart.each do |each_course|
                    course = Course.find_by(course_num: each_course[0])
                    Cart.create(user_id: user_id, course_number: course.course_num, course_name: course.course_name, course_time: course.course_time)
                    @cartDetails << {user_id: user_id, course_number: course.course_num, course_name: course.course_name, course_time: course.course_time}
                    if course_time_array.include?(course.course_time)
                        @overlap << course.course_time
                        flash[:colormessage] = "There is an overlap between courses indicated by warning symbols. Please go back to course listing page and remove the courses from the cart."
                    else
                        course_time_array << course.course_time
                    end
                end
                return
            else
                flash[:message] = "Cart size cannot be greater than 6. Please limit the courses."
            end
        else
           flash[:message] = "Nothing to add."
        end    
        redirect_to courses_path 
        return
    end
end

