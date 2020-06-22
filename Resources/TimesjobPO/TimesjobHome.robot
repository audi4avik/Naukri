*** Settings ***
Documentation   This page holds the objects for login page and credentials
Library  SeleniumLibrary

*** Variables ***
${updateProfileLink} =    xpath=//a[text()='Update Profile']
${denyNotification} =    xpath=//a[@id='notify-visitors-confirm-popup-btn-negative']

*** Keywords ***
Update Profile
    wait until element is visible    ${updateProfileLink}
    click element    ${denyNotification}
    click element    ${updateProfileLink}
    sleep    2 seconds

