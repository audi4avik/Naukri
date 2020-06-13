*** Settings ***
Documentation  This test is to upload a resume in naukri and verify the upload is successful
Resource  ../Data/InputData.robot  # necessary for Setup & Teardown
Resource  ../Resources/Common.robot  # necessary for Setup & Teardown
Resource  ../Resources/ResumeUpload.robot  # necessary for lower level keywords in test cases
Test Setup  Begin Web Test
Test Teardown  End Web Test

# robot -d Results -i Test1 Tests\Naukri.robot
*** Variables ***
# TODO - Modify these credentials to be feed from external file for different login scenarios and browsers

*** Test Cases ***

User Should Be Able To Upload Resume Successfully
    #Passing the variable to the lower level
    [Documentation]  This is test 1 success scenario
    [Tags]  Test1
    ResumeUpload.Login Steps    ${NAUKRI_URL}   @{LOGIN_CREDS}
    ResumeUpload.Upload Resume


User Should Be Able To Logout Successfully After Uploading Resume
    #Passing the variable to the lower level
    [Documentation]  This is test 2 success scenario with logout verification
    [Tags]  Test2
    ResumeUpload.Login Steps    ${NAUKRI_URL}   @{LOGIN_CREDS}
    ResumeUpload.Upload Resume
    ResumeUpload.Perform Logout