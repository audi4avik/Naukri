*** Settings ***
Documentation   This page holds the objects for login page and credentials
Library  SeleniumLibrary

*** Variables ***
${acceptCookie} =    xpath=//button[@class='waves-effect waves-light btn gdpr-btn']
${timesjobLogo} =    css=img[title='TimesJobs']

*** Keywords ***
Navigate To Times Landing Page
    [Arguments]    ${TIMES_URL}
    go to    ${TIMES_URL}
    wait until element is enabled   ${timesjobLogo}