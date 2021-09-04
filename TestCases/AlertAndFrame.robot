*** Settings ***
Library  SeleniumLibrary
Library  ../Library/getdriverpath.py


*** Variables ***
${url}  https://testautomationpractice.blogspot.com/
${browser}  chrome


*** Test Cases ***
Alert Test
    ${chromedriver_path} =  getdriverpath.Get Chromedriver Path
    Open Browser    ${url}     ${browser}   executable_path=${chromedriver_path}
    maximize browser window
    click button    xpath://button[text()='Click Me']
    sleep    3
    handle alert    ACCEPT
    sleep    3
    click button    xpath://button[text()='Click Me']
    sleep    3
    handle alert    DISMISS
    sleep    3
    click button    xpath://button[text()='Click Me']
    alert should be present    Press a button!
    close browser


Frame Test
    ${chromedriver_path} =  getdriverpath.Get Chromedriver Path
    Open Browser    https://www.selenium.dev/selenium/docs/api/java/index.html?overview-summary.html     ${browser}   executable_path=${chromedriver_path}
    maximize browser window
    select frame    name:packageListFrame
    click link    org.openqa.selenium
    unselect frame
    close browser
