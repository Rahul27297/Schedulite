FactoryBot.define do
  factory :course do
    course_num {'C1'}
    dept {'Computer Science'}
    course_name {'Course1'}
    professor {'Prof1'}
    requirement {'Major Core'}  
    course_time {'TR 1:10pm-2:25pm'} 
  end
end