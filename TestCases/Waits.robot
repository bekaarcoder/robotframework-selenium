*** Settings ***
Library  SeleniumLibrary
Library  ../Library/getdriverpath.py


*** Variables ***
${url}  http://www.practiceselenium.com/practice-form.html
${browser}  chrome


*** Test Cases ***
Wait Test
    ${chromedriver_path} =  getdriverpath.Get Chromedriver Path
    Open Browser    ${url}     ${browser}   executable_path=${chromedriver_path}
    maximize browser window
    set selenium implicit wait    10 seconds
    set selenium timeout    10 seconds
    wait until page contains    Registration     # default timeout is 5 secs
    set selenium speed    1 seconds    # used for debugging
    select radio button    sex  Female
    select radio button    exp  4