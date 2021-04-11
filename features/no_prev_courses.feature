Feature: course details

 As a student
 I can narrow down possible course options
 
 Background: courses and course details in database

  Given the following courses exist:
  | course_num   | dept   | course_name | professor   | requirement | course_time      |
  | C1           | CS     | Course1     |   Prof1     |  Major Core | TR 1:10pm-2:25pm |
  | C2           | CS     | Course2     |   Prof2     |  Major Core | TR 1:10pm-2:25pm |
  
  
  Given the following course details exist:
  | number       | points   | coursetype | method_of_inst   | detail         | 
  | C1           | 3        | Lecture    |   Online         |  skjbksbgdgg.. |
  | C2           | 3        | Lecture    |   In-person      |  skjbksbgdgg.. |
  
  Given the following users exist:
  | username       | password   |
  | admin          | 123        |
 
 Scenario: Visit previous courses page
  Given I login with username "admin" and password "123"
  Given I go to the Schedulite home page
  When I follow "Add Previously Taken Courses"
  And I press "Search"
  And I press "Update Course List"
  Then I should see "C1"
  And I should see "C2"
