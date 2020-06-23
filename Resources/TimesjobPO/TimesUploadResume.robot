*** Settings ***
Documentation    This page holds keywords for the Update Profile
Library    SeleniumLibrary
Library    DateTime

*** Variables ***
${lastUpdateDate} =    id=doc-modified-date
${uploadResumeButton} =    class=upload-res-btn
${chooseFile} =    xpath=//input[@name='resumeFile']
${saveBtn} =    xpath=//input[@id='submitbutton']
${currentUpdatedDate} =    xpath=//span[@id='profile-doc-modified-date']

*** Keywords ***
Update Resume
    [Arguments]    ${file}
    set selenium timeout    10 seconds
    ${lastUpdate} =    get text    ${lastUpdateDate}
    log    last updated on: ${lastUpdate}
    click element    ${uploadResumeButton}
    sleep    2 seconds
    choose file    ${chooseFile}    ${file}
    set selenium speed    0.5
    wait until element is visible    ${saveBtn}
    click element    ${saveBtn}
    wait until element is visible    ${currentUpdatedDate}

Verify Resume Update Date
    ${resumeUpdatedOn} =    get text    ${currentUpdatedDate}
    ${date} =    get current date    result_format=%d.%m.%Y
