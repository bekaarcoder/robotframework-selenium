*** Settings ***
Suite Setup    log to console    Opening Browser
Suite Teardown    log to console    Closing Browser

Test Setup    log to console    Login to application
Test Teardown    log to console    Logout from application


*** Test Cases ***
Test Case 1
    log to console    Test case 1 executing
    log to console    Test case 1 executed

Test Case 2
    log to console    Test case 2 executing
    log to console    Test case 2 executed