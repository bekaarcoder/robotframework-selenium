*** Settings ***
Library  SeleniumLibrary
Library  ../Library/getdriverpath.py


*** Variables ***
${url}  https://admin-demo.nopcommerce.com/
${browser}  firefox
${remote_url}    http://localhost:4444/wd/hub


*** Test Cases ***
LoginTest
    ${desired_caps} =    create dictionary    browserName=firefox    marionette=True   acceptInsecureCerts=True
    Open Browser    ${url}     ${browser}   remote_url=${remote_url}    desired_capabilities=${desired_caps}
    Login To Application
    Close Browser

*** Keywords ***
Login To Application
    Input Text      id:Email    admin@yourstore.com
    Input Text      id:Password     admin
    Click Button    xpath://button[text()='Log in']

