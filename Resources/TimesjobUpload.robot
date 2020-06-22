*** Settings ***
Documentation   This page connects to lower level page objects
Resource  ./TimesjobPO/TimesLanding.robot
Resource  ./TimesjobPO/TimesLogin.robot
Resource  ./TimesjobPO/TimesjobHome.robot
Resource  ./TimesjobPO/TimesUploadResume.robot
Resource  ./TimesjobPO/TimesjobLogout.robot

*** Keywords ***
Login Steps
    [Documentation]  Perform login scenarios
    [Arguments]  ${TIMES_URL}  @{loginCreds}
    TimesLanding.Navigate To Times Landing Page   ${TIMES_URL}
    TimesLogin.Login To Timesjob  @{loginCreds}

Upload Resume
    [Documentation]  Perform upload resume operation
    [Arguments]    ${file}
    TimesjobHome.Update Profile
    TimesUploadResume.Update Resume     ${file}
    TimesUploadResume.Verify Resume Update Date

Perform Logout
    [Documentation]  Perform logout operation
    TimesjobLogout.Click On Logout

