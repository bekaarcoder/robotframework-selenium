*** Settings ***
Library  SeleniumLibrary
Library  ../Library/getdriverpath.py


*** Variables ***
${url}  http://www.practiceselenium.com/practice-form.html
${browser}  chrome


*** Test Cases ***
Close Browser Test
    ${chromedriver_path} =  getdriverpath.Get Chromedriver Path
    Open Browser    ${url}     ${browser}   executable_path=${chromedriver_path}
    maximize browser window
    Open Browser    ${url}     ${browser}   executable_path=${chromedriver_path}
    maximize browser window
    close all browsers