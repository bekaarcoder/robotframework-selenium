*** Settings ***
Library  SeleniumLibrary
Library  ../Library/getdriverpath.py


*** Variables ***
${url}  http://demo.guru99.com/test/simple_context_menu.html
${browser}  chrome


*** Test Cases ***
Right Click Test
    ${chromedriver_path} =  getdriverpath.Get Chromedriver Path
    Log To Console  ${chromedriver_path}
    Open Browser    ${url}     ${browser}   executable_path=${chromedriver_path}
    maximize browser window
    open context menu    xpath://span[text()='right click me']
    sleep    3


Double Click Test
    press keys      ${None}    ESC
    sleep    3
    double click element    xpath://button
    sleep    3
    HANDLE ALERT    ACCEPT
    close browser


Drag and Drop Test
    ${chromedriver_path} =  getdriverpath.Get Chromedriver Path
    open browser    https://testautomationpractice.blogspot.com/    ${browser}    executable_path=${chromedriver_path}
    maximize browser window
    drag and drop    id:draggable    id:droppable
    sleep    3
    close browser


