*** Settings ***
Library  SeleniumLibrary
Library  ../Library/getdriverpath.py


*** Variables ***
${url}  http://www.practiceselenium.com/practice-form.html
${browser}  chrome


*** Test Cases ***
Screenshot Test
    ${chromedriver_path} =  getdriverpath.Get Chromedriver Path
    Open Browser    ${url}     ${browser}   executable_path=${chromedriver_path}
    maximize browser window
    capture element screenshot    xpath://form    C:/Users/shash/Documents/Projects/PyCharmProjects/RobotFrameworkSelenium/form.png
    capture page screenshot    C:/Users/shash/Documents/Projects/PyCharmProjects/RobotFrameworkSelenium/page.png