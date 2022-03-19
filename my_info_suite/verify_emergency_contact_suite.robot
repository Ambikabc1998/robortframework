*** Settings ***
Documentation      This suite handles test case related to emergency contact
Resource    ../Resource/Base/CommonFunctionality.resource
Resource    ../Resource/Pages/LoginPage.resource
Resource    ../Resource/Pages/MainPage.resource
Resource    ../Resource/Pages/MyInfoPage.resource
Resource    ../Resource/Pages/EmergencyContactPage.resource

Library     DataDriver      file=../test_data/orange_data.xlsx      sheet_name=AddEmergencyContact

Test Setup      Launch Browser And Navigate To URL
Test Teardown      Close Browser

Test Template       Verify Add Emergency Contact Template

*** Test Cases ***
Verify Add Emergency Contact Test

*** Keywords ***
Verify Add Emergency Contact Template
    [Arguments]     ${username}     ${password}     ${contact_name}     ${relationship}     ${home_telephone}
    Enter Username      ${username}
    Enter Password    ${password}
    Click On Login
    Click On MyInfo
    Click On Emergency Contact
    Click On Add Emergency Contact
    Enter Contact Name      ${contact_name}
    Enter Relationship      ${relationship}
    Enter Home Telephone    ${home_telephone}
    Click On Save
    Validation On Added Contacts    ${contact_name}     ${relationship}     ${home_telephone}