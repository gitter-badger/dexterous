Feature: Login facility
    A user should be able to login from home page or from a dedicated login
    page

    Scenario: Home page with javascript disabled
        When user visits home page
        Then login link should be present
        When login link is clicked
        Then user should be directed to dedicated login page

    @javascript
    Scenario: Home page with javascript enabled
        Given a user account with email "johndoe@example.com" and password "password" exists
        When user visits home page
        Then login link should be present
        When login link is clicked
        Then a popup should appear
        When user enters login credentials as "johndoe@example.com" and "password"
        And user clicks on submit button in login form
        Then page should show message "Signed in successfully."

    Scenario: Dedicated login page
        Given a user account with email "johndoe@example.com" and password "password" exists
        When user visits login page
        Then Login form should be present
        When user enters login credentials as "johndoe@example.com" and "password"
        And user clicks on submit button in login form
        Then user should be directed to home page
        And page should show message "Signed in successfully."