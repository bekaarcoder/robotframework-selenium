*** Settings ***
Library  SeleniumLibrary
Library  ../Library/getdriverpath.py


*** Variables ***
${url}  https://admin-demo.nopcommerce.com/
${browser}  chrome


*** Test Cases ***
Input Box Test
    ${chromedriver_path} =  getdriverpath.Get Chromedriver Path
    Open Browser    ${url}     ${browser}   executable_path=${chromedriver_path}
    maximize browser window
    title should be    Your store. Login
    ${email_path}   set variable    id:Email
    element should be visible    ${email_path}
    element should be enabled    ${email_path}
    input text    ${email_path}    admin@yourstore.com
    sleep    3
    clear element text    ${email_path}
    sleep    3
    Close Browser



