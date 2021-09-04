*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Login_Resources.robot
Library    DataDriver    ../TestData/LoginData.xlsx    sheet_name=Sheet1
Suite Setup    Launch Browser
Suite Teardown    Close Browsers
Test Template    Invalid Login


*** Test Cases ***
Login test with excel using ${username} ${password}


*** Keywords ***
Invalid Login
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input User Password    ${password}
    Click Login Button
    Validate Error Message