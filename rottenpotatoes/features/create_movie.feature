Feature: add a new movie

  As a movie buff
  So that I can add new movies

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: add new movie to list of movies
  Given I am on the Add new movie page
  Then  I should see "Create New Movie"
  When  I fill in "Title" with "My Movie"
  And   I select "PG-13" from "Rating"
  And   I press "Save Changes"
  Then I should be on the home page
  And I should see "My Movie was successfully created."
  And I should see "My Movie"


