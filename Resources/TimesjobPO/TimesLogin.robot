*** Settings ***
Documentation   This page holds the objects for login page and credentials
Library  SeleniumLibrary

*** Variables ***
${loginBtn} =    xpath=//li[@class='login-reg']/a[text()='Login']
${usernameField} =    xpath=//input[@id='j_username']
${passwordField} =    xpath=//input[@id='j_password']
${submitLogin} =    xpath=//form[@id='header_thickbox_login_form']//input[@value='Login']

*** Keywords ***
Login To Timesjob
    [Arguments]    @{loginCreds}
    click element    ${loginBtn}
    sleep    2 seconds
    input text   ${usernameField}    ${loginCreds}[0]
    input password    ${passwordField}     ${loginCreds}[1]
    click element    ${submitLogin}
