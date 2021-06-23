Feature: Products Page

  Scenario: Verify that you see 2 card products, Aspiration and Aspiration Plus.
    Given User goes to Aspiration.com's home page
    When Clicks on Spend & Save link on navigation bar
    Then Can see two card products

  Scenario: Verify that when you click Get Aspiration, a modal to sign up appears.
    Given User goes to Aspiration.com's home page
    When Clicks on Spend & Save link on navigation bar
    And Clicks on Get Aspiration button
    Then Sign up modal appears

  Scenario: Verify that when you click Get Aspiration Plus, a modal with monthly and yearly plans appears.
    Given User goes to Aspiration.com's home page
    When Clicks on Spend & Save link on navigation bar
    And Clicks on Get Aspiration Plus button
    Then Subscription modal appears

  Scenario: Verify that yearly radio option is $71.88 paid once yearly
    Given User goes to Aspiration.com's home page
    When Clicks on Spend & Save link on navigation bar
    And Clicks on Get Aspiration Plus button
    Then On Modal, yearly radio option is $71.88 paid once yearly

  Scenario: Verify that monthly radio option is $7.99 paid monthly
    Given User goes to Aspiration.com's home page
    When Clicks on Spend & Save link on navigation bar
    And Clicks on Get Aspiration Plus button
    Then On modal, monthly radio option is $7.99 paid monthly
