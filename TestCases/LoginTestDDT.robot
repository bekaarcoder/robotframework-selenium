*** Settings ***
Library  SeleniumLibrary
Library  ../Library/getdriverpath.py
Resource    ../Resources/Login_Resources.robot
Suite Setup    Launch Browser
Suite Teardown    Close Browsers
Test Template    Invalid Login


*** Test Cases ***           USERNAME                PASSWORD
Login with empty password    admin@yourstore.com     ${EMPTY}
Login with invalid user      adm@yourstore.com       admin


*** Keywords ***
Invalid Login
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input User Password    ${password}
    Click Login Button
    Validate Error Message
