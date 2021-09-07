*** Settings ***
Library  SeleniumLibrary
Library  ../Library/getdriverpath.py


*** Variables ***
${url}  http://www.bing.com
${browser}  chrome


*** Test Cases ***
Multiple Browser Test
    ${chromedriver_path} =  getdriverpath.Get Chromedriver Path
    Open Browser    ${url}     ${browser}   executable_path=${chromedriver_path}
    maximize browser window
    Open Browser    https://www.google.com     ${browser}   executable_path=${chromedriver_path}
    maximize browser window
    switch browser    1
    ${title} =      get title
    log to console    ${title}
    sleep    3
    switch browser    2
    ${title} =    get title
    log to console    ${title}
    sleep    3
    close all browsers

