*** Settings ***
Documentation  This page automates the functionality of uploading a resume and validation
Library  SeleniumLibrary
Resource  ../../Data/InputData.robot  # necessary for Setup & Teardown

*** Variables ***
${uploadButton} =   xpath=//input[@id='attachCV']
${updateDate} =  xpath=//span[@class='updateOn']

*** Keywords ***
Update Resume
    wait until element is visible    ${updateDate}     8 seconds
    scroll element into view    ${uploadButton}
    choose file  ${uploadButton}    ${file}
    set selenium implicit wait    2 seconds
    ${uploadDate} =   get text  ${updateDate}
    log to console  ${uploadDate}
    sleep    2 seconds