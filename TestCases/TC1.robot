*** Settings ***
Library  SeleniumLibrary
Library  ../Library/getdriverpath.py


*** Variables ***
${url}  https://admin-demo.nopcommerce.com/
${browser}  chrome


*** Test Cases ***
LoginTest
    ${chromedriver_path} =  getdriverpath.Get Chromedriver Path
    Log To Console  ${chromedriver_path}
    Open Browser    ${url}     ${browser}   executable_path=${chromedriver_path}
    Login To Application
    Close Browser

*** Keywords ***
Login To Application
    Input Text      id:Email    admin@yourstore.com
    Input Text      id:Password     admin
    Click Button    xpath://button[text()='Log in']

