*** Settings ***
Documentation  This test is to upload a resume in Timesjob and verify the upload is successful
Resource  ../Data/InputData.robot  # necessary for Setup & Teardown
Resource  ../Resources/Common.robot  # necessary for Setup & Teardown
Resource  ../Resources/TimesjobUpload.robot  # necessary for lower level keywords in test cases
Test Setup  Begin Web Test
Test Teardown  End Web Test

# robot -d Results -i Test1 Tests\Timesjob.robot

*** Test Cases ***
User Should Be Able To Upload Resume Successfully
    #Passing the variable to the lower level
    [Documentation]  This is Timesjob success scenario with logout verification
    [Tags]  Times
    TimesjobUpload.Login Steps    ${TIMES_URL}   @{LOGIN_CREDS}
    TimesjobUpload.Upload Resume    ${file}
    TimesjobUpload.Perform Logout