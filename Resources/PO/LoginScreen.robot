*** Settings ***
Documentation   This page holds the objects for login page and credentials
Library  SeleniumLibrary

*** Variables ***
${loginLink} =  xpath=//a[@title='Jobseeker Login']
${inputEmail} =  xpath=//div[@class='drawer-wrapper']//div[@class='form-row'][1]/input[@type='text']
${inputPwd} =   xpath=//div[@class='drawer-wrapper']//div[@class='form-row'][2]/input[@type='password']
${loginBtn} =   xpath=//button[@class='btn-primary loginButton']

*** Keywords ***
#Passing the variable to the Keywords
Login To Naukri
    [Arguments]  @{loginCreds}
    Click Login Link
    Enter User "Email"  @{loginCreds}
    Enter User "Password"  @{loginCreds}
    Click "Login" Button


Click Login Link
    click element   ${loginLink}
    wait until page contains element    ${inputEmail}

Enter User "Email"
    [Arguments]  @{loginCreds}
    input text  ${inputEmail}  @{loginCreds}[0]
    set browser implicit wait  1s

Enter User "Password"
    [Arguments]  @{loginCreds}
    input password  ${inputPwd}  @{loginCreds}[1]
    set browser implicit wait  1s

Click "Login" Button
    click button  ${loginBtn}
    set selenium implicit wait  2s





