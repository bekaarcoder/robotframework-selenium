*** Settings ***
Library  SeleniumLibrary
Library  ../Library/getdriverpath.py


*** Variables ***
${url}  http://www.practiceselenium.com/practice-form.html
${browser}  chrome


*** Test Cases ***
Dropdown Test
    ${chromedriver_path} =  getdriverpath.Get Chromedriver Path
    Open Browser    ${url}     ${browser}   executable_path=${chromedriver_path}
    maximize browser window
    select from list by label    id:continents    Europe
    sleep    2
    select from list by index    id:continents    3
    sleep    2


List Box Test
    select from list by label    id:selenium_commands    Switch Commands
    sleep    2
    select from list by label    id:selenium_commands    Wait Commands
    sleep    2
    unselect from list by label    id:selenium_commands    Switch Commands
    sleep    2
    close browser