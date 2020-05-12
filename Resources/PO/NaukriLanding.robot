*** Settings ***
Documentation  This page deals with Naukri landing page elements
Library  SeleniumLibrary

*** Variables ***
${privacyPolicyBtn} =    xpath=//div[@class='privacyPolicy']//button
${shareLocation} =    xpath=//div[@id='geoLocPopUp']//span[text()='Later']
*** Keywords ***
Navigate To Naukri Landing Page
    [Arguments]  ${naukriURL}
    Go To   ${naukriURL}

Verify Page Loaded
    Wait Until Page Contains  Login
    ${privacyPolicyBtnVisibility}    run keyword and return status
    ...                                 page should contain element    ${privacyPolicyBtn}
    ${shareLocationVisibility}       run keyword and return status
    ...                                 page should contain element    ${shareLocation}

    run keyword if    ${privacyPolicyBtnVisibility} == True    Accept Privacy Policy
    ...    ELSE IF    ${shareLocationVisibility} == True       Click Later
    ...    ELSE       log    Proceed to Login

Accept Privacy Policy
        click element    ${privacyPolicyBtn}

Click Later
        click element    ${shareLocation}