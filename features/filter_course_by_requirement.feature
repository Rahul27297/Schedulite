Feature: filter course by requirement

  As a student
  So that I can filter courses by requirement

Background: courses in database

  Given the following courses exist:
  | course_num   | dept   | course_name | professor   | requirement                    | course_time      |
  | C1           | CS     | Course1     |   Prof1     |  Major Core                    | TR 1:10pm-2:25pm |
  | C2           | CS     | Course2     |   Prof2     |  General Technical Requirement | TR 1:10pm-2:25pm |
  | C3           | EE     | Course3     |   Prof3     |  General Technical Elective    | TR 1:10pm-2:25pm |
  | C4           | EE     | Course4     |   Prof4     |  Track Course                  | TR 1:10pm-2:25pm |
  | C5           | CE     | Course5     |   Prof5     |  Track Course                  | TR 1:10pm-2:25pm |
  
  Given the following users exist:
  | username       | password   |
  | admin          | 123        |
  
  


Scenario: list all courses without filters
    Given I login with username "admin" and password "123"
    When I go to the Schedulite home page
    Then I should see "C1"
    And  I should see "C3"
    And  I should see "C5"

Scenario: filter courses by requirement
    Given I login with username "admin" and password "123"
    Given I am on the Schedulite home page
    When  I check "requirements[Track Course]"
    When   I press "Refresh"
    Then  I should see "C4"
    And   I should see "C5"
    And   I should not see "C1"
    And   I should not see "C2"
    And   I should not see "C3"
    And I logout
    
Scenario: filter courses by multiple requirement
    Given I login with username "admin" and password "123"
    Given I am on the Schedulite home page
    When  I check "requirements[Major Core]"
    When  I check "requirements[General Technical Elective]"
    When   I press "Refresh"
    Then  I should see "C1"
    And   I should not see "C2"
    And   I should see "C3"
    And   I should not see "C4"
    And   I should not see "C5"
