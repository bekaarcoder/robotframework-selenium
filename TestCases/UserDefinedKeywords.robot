*** Settings ***
Library  SeleniumLibrary
Resource    ../Resources/Resources.robot


*** Variables ***
${url}  http://www.practiceselenium.com/practice-form.html
${browser}  headlesschrome


*** Test Cases ***
Check Title
    ${page_title} =    Launch Browser    ${url}    ${browser}
    log to console    ${page_title}


