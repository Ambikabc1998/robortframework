*** Settings ***
Documentation

Resource    ../Resource/Base/CommonFunctionality.resource

Test Setup      Launch Browser and navigate to url
Test Teardown       Close Browser
Test Template       Verify Add Emercency Contact Test

*** Test Cases ***
TC1     Admin   admin123    john    brother     787878
TC2     Admin   admin123    sandy   sister      787878

*** Keywords ***
Verify Add Emercency Contact Test
    [Arguments]     ${userename}    ${password}     ${contact_name}     ${relationship}     ${home_telephone}
    Input Text    id=txtUsername    ${userename}
    Input Password    id=txtPassword    ${password}
    Click Element    id=btnLogin
    Page Should Contain    My Info
    Click Element    link=My Info
    Click Element    link=Emergency Contacts
    Click Element    id=btnAddContact
    Input Text    id=emgcontacts_name    ${contact_name}
    Input Text    id=emgcontacts_relationship    ${relationship}
    Input Text    id=emgcontacts_homePhone    ${home_telephone}
    Click Element    id=btnSaveEContact
    Table Should Contain    id=emgcontact_list    ${contact_name}
    Table Should Contain    id=emgcontact_list    ${home_telephone}