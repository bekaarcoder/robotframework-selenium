*** Settings ***
Library  SeleniumLibrary
Library  ../Library/getdriverpath.py


*** Variables ***
${url}  https://admin-demo.nopcommerce.com/
${browser}  firefox


*** Test Cases ***
LoginTest
    ${geckodriver_path} =  getdriverpath.get geckdodriver path
    Log To Console  ${geckodriver_path}
    Open Browser    ${url}     ${browser}   executable_path=${geckodriver_path}
    Login To Application
    Close Browser

*** Keywords ***
Login To Application
    Input Text      id:Email    admin@yourstore.com
    Input Text      id:Password     admin
    Click Button    xpath://button[text()='Log in']

