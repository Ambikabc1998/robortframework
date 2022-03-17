*** Settings ***
Documentation
...  credential test.

Resource    ../Resource/Base/CommonFunctionality.resource

Test Teardown       Close Browser

*** Test Cases ***
verify Valid Credential Test

    Launch Browser and navigate to url
    Input Text    id=txtUsername    Abcd
    Input Password    id=txtPassword    abcd123
    Click Element    id=btnLogin
    Element Text Should Be    xpath=//span[@id='spanMessage']    Invalid credentials