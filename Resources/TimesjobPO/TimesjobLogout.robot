*** Settings ***
Documentation   This page holds the objects for login page and credentials
Library  SeleniumLibrary

*** Variables ***
${myprofileLink} =    xpath=//a[@data-activates='profDropdown']
${logoutLink} =    xpath=//a[@class='sign-out']

*** Keywords ***
Click On Logout
    mouse over    ${myprofileLink}
    click element    ${logoutLink}
    sleep    2 seconds
