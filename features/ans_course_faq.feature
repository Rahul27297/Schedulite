Feature: answer a course faq

  As a professor
  So that I can answer a faq for a given course

Background: courses in database

  Given the following courses exist:
  | course_num   | dept   | course_name | professor   | requirement | course_time      |
  | C1           | CS     | Course1     |   Prof1     |  Major Core | TR 1:10pm-2:25pm |
  | C2           | CS     | Course2     |   Prof2     |  Major Core | TR 1:10pm-2:25pm |
  | C3           | EE     | Course3     |   Prof3     |  Major Core | TR 1:10pm-2:25pm |
  | C4           | EE     | Course4     |   Prof4     |  Major Core | TR 1:10pm-2:25pm |
  | C5           | CE     | Course5     |   Prof5     |  Major Core | TR 1:10pm-2:25pm |

  Given the following course details exist:
  | number       | points   | coursetype | method_of_inst   | detail           | 
  | C1           | 3        | Lecture    |   Online         |  Details for C1. |
  | C2           | 3        | Lecture    |   In-person      |  Details for C2. |

  Given the following course faqs exist:
  | number       | question                           | course_number |
  | 1            | What is the grading schema?        | C1            |
  
  Given the following users exist:
  | username       | password   |
  | admin          | 123        |

Scenario: answer a faq for a course
    Given I login with username "admin" and password "123"
    Given I am on the Schedulite home page
    When I follow "More about Course1"
    Then  I should be on course details page for "C1"
    And I should see "What is the grading schema?"
    When I fill in "50% assignments, 20% midterm and 30% final" for "inputAnswer"
    And I press "Answer"
    Then I should be on course details page for "C1"
    And I should see "What is the grading schema?"
    And I should see "50% assignments, 20% midterm and 30% final"