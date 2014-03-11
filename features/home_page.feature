Feature: Home Page Banner
    A user visiting the home page should be greeted with a banner explaining
    the basic premise of Dexterous

    Scenario: User visits home page
        When user visits home page
        Then Project tagline should be visible
