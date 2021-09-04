*** Settings ***
Library  SeleniumLibrary
Library  ../Library/getdriverpath.py
Variables    ../PageObjects/Locators.py

*** Variables ***
${url}  https://admin-demo.nopcommerce.com/
${browser}  chrome


*** Keywords ***
Launch Browser
    ${chromedriver_path} =  getdriverpath.Get Chromedriver Path
    Open Browser    ${url}     ${browser}   executable_path=${chromedriver_path}
    maximize browser window

Close Browsers
    close all browsers

Validate Title
    [Arguments]    ${title}
    title should be    ${title}

Input Username
    [Arguments]    ${value}
    input text    ${username_locator}    ${value}

Input User Password
    [Arguments]    ${value}
    input text    ${password_locator}    ${value}

Click Login Button
    click button    ${login_btn_locator}

Click Logout
    click link    Logout

Validate Error Message
    page should contain element    xpath://div[contains(@class, 'message-error')]

Validate Login Successful
    page should contain    Dashboard