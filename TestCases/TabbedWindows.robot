*** Settings ***
Library  SeleniumLibrary
Library  ../Library/getdriverpath.py


*** Variables ***
${url}  http://demo.automationtesting.in/Windows.html
${browser}  chrome


*** Test Cases ***
Tabbed Window Test
    ${chromedriver_path} =  getdriverpath.Get Chromedriver Path
    Open Browser    ${url}     ${browser}   executable_path=${chromedriver_path}
    maximize browser window
    click element    xpath://a//button[contains(text(), 'click')]
    ${handles} =    get window handles
    sleep    3
    switch window    Selenium
    sleep    3
    page should contain    Selenium automates browsers
    switch window    Frames & windows
    sleep    3
    page should contain    Automation Demo Site
    log to console    ${handles}
    switch window    NEW
    go to    https://www.google.com
    sleep    3
    switch window    MAIN
    sleep    3
    Close Browser

