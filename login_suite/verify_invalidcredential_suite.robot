*** Settings ***
Documentation
...  credential test.

Resource    ../Resource/Base/CommonFunctionality.resource

Test Setup      Launch Browser and navigate to url
Test Teardown       Close Browser
Test Template      verify Invalid Credential Template

*** Test Cases ***
TC1     Joha    john123     Invalid credentials
TC2     Peter   peter123    Invalid credentials



*** Keywords ***
verify Invalid Credential Template
    [Arguments]     ${username}     ${password}     ${expected_error}
    Input Text    id=txtUsername    ${username}
    Input Password    id=txtPassword    ${password}
    Click Element    id=btnLogin
    Element Text Should Be    xpath=//span[@id='spanMessage']    ${expected_error}
