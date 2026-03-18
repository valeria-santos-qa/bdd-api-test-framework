Feature: Posts API
  Validate operations for posts endpoints.


Scenario: Retrieve all posts successfully
    When I send a GET request to "/posts"
    Then the response status should be 200
    And the response should contain a list of posts


Scenario: Retrieve a specific post by ID successfully
    When I send a GET request to "/posts/1" with a valid id
    Then the response status should be 200
    And the response should contain a post with id 1
    And the response should contain a post with title "sunt aut facere repellat provident occaecati excepturi optio reprehenderit"
    And the response should contain a post with body:
      """
      quia et suscipit
      suscipit recusandae consequuntur expedita et cum
      reprehenderit molestiae ut ut quas totam
      nostrum rerum est autem sunt rem eveniet architecto
      """

