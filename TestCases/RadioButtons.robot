*** Settings ***
Library  SeleniumLibrary
Library  ../Library/getdriverpath.py


*** Variables ***
${url}  http://www.practiceselenium.com/practice-form.html
${browser}  chrome

*** Test Cases ***
Radio Button Test
    ${chromedriver_path} =  getdriverpath.Get Chromedriver Path
    Open Browser    ${url}     ${browser}   executable_path=${chromedriver_path}
    maximize browser window
    set selenium speed    1 seconds
    select radio button    sex  Female
    select radio button    exp  4

Checkbox Test
    select checkbox    name:BlackTea
    select checkbox    name:RedTea
    unselect checkbox    name:BlackTea
    close browser