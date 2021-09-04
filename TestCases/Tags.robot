*** Settings ***

*** Test Cases ***
TC1 User Registration Test
    [Tags]    sanity
    log to console    Open registration page
    log to console    Registration Successful

TC2 User Login Test
    [Tags]    sanity
    log to console    Open Login page
    log to console    Login successful

TC3 User Logout Test
    [Tags]    smoke
    log to console    Open Application
    log to console    Login to app
    log to console    Logout successful

# Include tag while running test
# > robot --include=sanity Tags.robot
# > robot -i=sanity Tags.robot

# Include multiple tags
# > robot -i=sanity -i=smoke Tags.robot

# Exclude tag
# > robot --exclude=smoke TestCases\Tags.robot
# > robot -e=smoke TestCases\Tags.robot