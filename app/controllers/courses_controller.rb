class CoursesController < ApplicationController
    
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
end