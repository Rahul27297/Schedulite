Feature: filter course by department

  As a student
  So that I can see courses by department

Background: courses in database

  Given the following courses exist:
  | course_num   | dept   | course_name | professor   | requirement | course_time      |
  | C1           | CS     | Course1     |   Prof1     |  Major Core | TR 1:10pm-2:25pm |
  | C2           | CS     | Course2     |   Prof2     |  Major Core | TR 1:10pm-2:25pm |
  | C3           | EE     | Course3     |   Prof3     |  Major Core | TR 1:10pm-2:25pm |
  | C4           | EE     | Course4     |   Prof4     |  Major Core | TR 1:10pm-2:25pm |
  | C5           | CE     | Course5     |   Prof5     |  Major Core | TR 1:10pm-2:25pm |

Scenario: list all courses without filters
    When I go to the Schedulite home page
    Then I should see "C1"
    And  I should see "C3"
    And  I should see "C5"

Scenario: filter courses by dropdown
    Given I am on the Schedulite home page
    When  I go to courses page for "CS" department
    Then  I should see "C1"
    And   I should see "C2"
    And   I should not see "C3"
    And   I should not see "C4"
    And   I should not see "C5"    