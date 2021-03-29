Feature: From course details to back

 As a student
 I can click update course list and return to home page
 
 Background: courses and course details in database

  Given the following courses exist:
  | course_num   | dept   | course_name | professor   | requirement | course_time      |
  | C1           | CS     | Course1     |   Prof1     |  Major Core | TR 1:10pm-2:25pm |
  | C2           | CS     | Course2     |   Prof2     |  Major Core | TR 1:10pm-2:25pm |
  
  
  Given the following course details exist:
  | number       | points   | coursetype | method_of_inst   | detail         | 
  | C1           | 3        | Lecture    |   Online         |  skjbksbgdgg.. |
  | C2           | 3        | Lecture    |   In-person      |  skjbksbgdgg.. |
 

 Scenario: Finished updating already taken courses
  Given I go to the Schedulite home page
  When I follow "Add Previously Taken Courses"
  Then I should see "Already Taken"
  When I press "Update Course List"
  Then I should be on the updated Schedulite home page
    
    
