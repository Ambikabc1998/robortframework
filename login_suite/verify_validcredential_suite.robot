*** Settings ***
Documentation
...  credential test.

Resource    ../Resource/Base/CommonFunctionality.resource

Test Setup      Launch Browser and navigate to url
Test Teardown       Close Browser

*** Test Cases ***
verify Valid Credential Test
    Input Text    id=txtUsername    Admin
    Input Password    id=txtPassword    admin123
    Click Element    id=btnLogin
    Page Should Contain    My Info
    Capture Page Screenshot