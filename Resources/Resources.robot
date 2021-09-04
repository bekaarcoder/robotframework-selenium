*** Settings ***
Library  SeleniumLibrary
Library  ../Library/getdriverpath.py

*** Keywords ***
Launch Browser
    [Arguments]    ${appUrl}    ${appBrowser}
    ${chromedriver_path} =  getdriverpath.Get Chromedriver Path
    open browser    ${appUrl}    ${appBrowser}    executable_path=${chromedriver_path}
    maximize browser window
    ${title} =    get title
    [Return]    ${title}