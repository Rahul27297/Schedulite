Feature: course details

 As a student
 I can add courses to cart
 
 Background: courses and course details in database

  Given the following courses exist:
  | course_num   | dept   | course_name | professor   | requirement | course_time        |
  | C1           | CS     | Course1     |   Prof1     |  Major Core | TR 1:10pm-2:25pm   |
  | C2           | CS     | Course2     |   Prof2     |  Major Core | MW 2:10pm-3:25pm   |
  | C3           | CS     | Course3     |   Prof3     |  Major Core | FR 1:10pm-2:25pm   |
  | C4           | CS     | Course4     |   Prof4     |  Major Core | MW 1:10pm-2:25pm   |
  | C5           | CS     | Course5     |   Prof5     |  Major Core | TR 2:10pm-3:25pm   |
  | C6           | CS     | Course6     |   Prof6     |  Major Core | FR 11:10am-12:25pm |
  | C7           | CS     | Course7     |   Prof7     |  Major Core | TR 1:10pm-2:25pm   |

  Given the following users exist:
  | username       | password   |
  | admin          | 123        |
 
 
 Scenario: Check add to cart 
  Given I login with username "admin" and password "123"
  Then I should be on the Schedulite home page 
  When I check the following course: C1, C2
  When   I press "Add To Cart"
  Then  I should see "C1"
  And   I should see "C2"
  
 Scenario: Check add to cart with no courses selected 
  Given I login with username "admin" and password "123"
  Given I go to the Schedulite home page
  When   I press "Add To Cart"
  Then I should be on the Schedulite home page
  And   I should see "Nothing to add."
 
 Scenario: Check add to cart with seven courses selected
  Given I login with username "admin" and password "123"
  Given I go to the Schedulite home page
  When I check the following course: C1, C2, C3, C4, C5, C6, C7
  When   I press "Add To Cart"
  Then I should be on the Schedulite home page
  And   I should see "Cart size cannot be greater than 6. Please limit the courses."