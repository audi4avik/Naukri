*** Settings ***
Documentation   This page holds the objects for login page and credentials
Library  SeleniumLibrary

*** Variables ***
${updateProfileLink} =    xpath=//a[text()='Update Profile']
${denyNotification} =    xpath=//a[@id='notify-visitors-confirm-popup-btn-negative']

*** Keywords ***
Update Profile
    set selenium timeout    10 seconds
    wait until element is visible    ${updateProfileLink}

    ${denyButtonStatus} =    run keyword and return status    ${denyNotification}    is visible
    run keyword if    ${denyButtonStatus} == True  Deny and Continue
    ...    ELSE                                   Continue

Deny and Continue
    click element    ${denyNotification}
    click element    ${updateProfileLink}
    sleep    2 seconds

Continue
    click element    ${updateProfileLink}
    sleep    2 seconds

