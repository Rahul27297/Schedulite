Feature: course details

 As a student
 I can add courses to cart
 
 Background: courses and course details in database

  Given the following courses exist:
  | course_num   | dept   | course_name | professor   | requirement | course_time      |
  | C1           | CS     | Course1     |   Prof1     |  Major Core | TR 1:10pm-2:25pm |
  | C2           | CS     | Course2     |   Prof2     |  Major Core | TR 1:10pm-2:25pm |
  | C3           | CS     | Course3     |   Prof3     |  Major Core | FR 8:10am-9:25am |

  Scenario: Check add to cart with time overlap message
  Given I go to the Schedulite home page
  When I check the following course: C1, C2
  When   I press "Add To Cart"
  Then  I should see "There is an overlap between courses indicated by warning symbols. Please go back to course listing page and remove the courses from the cart."
  Then  I should see "C1"
  And   I should see "C2" 
  
  Scenario: Check add to cart with time overlap message and 
  Given I go to the Schedulite home page
  When I check the following course: C1, C2
  When   I press "Add To Cart"
  Then  I should see "There is an overlap between courses indicated by warning symbols. Please go back to course listing page and remove the courses from the cart."
  When   I press "Back to Course list"
  Then I should be on the Schedulite home page
  When I uncheck the following course: C1
  When I check the following course: C3
  When   I press "Add To Cart"
  Then  I should not see "There is an overlap between courses indicated by warning symbols. Please go back to course listing page and remove the courses from the cart."
  And   I should see "C2"
  And   I should see "C3"
