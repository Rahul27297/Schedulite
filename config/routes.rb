Rails.application.routes.draw do
  root :to => redirect('/courses')
  match '/prevcoursesform', to: 'courses#prevcoursesform', via: :all
  get    '/courses(.:format)' => 'courses#index', as: :courses
  get    '/updatedcourses(.:format)' => 'courses#updatedcourses', as: :updatedcourses  
  get    '/courses/:id(.:format)' => 'courses#show', as: :course_detail
  post   '/course/ans/:id(.:format)' => 'courses#add_ans', as: :course_ans
  post   '/course/faq/:id(.:format)' => 'courses#add_faq', as: :course_faq
  end
