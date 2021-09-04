*** Settings ***
Library  SeleniumLibrary
Library  ../Library/getdriverpath.py


*** Variables ***
${url}  https://testautomationpractice.blogspot.com/
${browser}  chrome


*** Test Cases ***
Table Test
    ${chromedriver_path} =  getdriverpath.Get Chromedriver Path
    Open Browser    ${url}     ${browser}   executable_path=${chromedriver_path}
    maximize browser window
    ${rows} =    get element count    xpath://table[@name='BookTable']//tr
    ${columns} =    get element count    xpath://table[@name='BookTable']//tr[1]//th
    log to console    Number of rows: ${rows}
    log to console    Number of columns: ${columns}

    FOR   ${i}    IN RANGE    2   ${rows} + 1
        FOR    ${j}     IN RANGE    1   ${columns} + 1
            ${value} =    get text    xpath://table[@name='BookTable']//tr[${i}]//td[${j}]
            log to console    ${value}
        END
    END

    close browser