*** Comments ***
Create testcase then connet with template & excel
1. Enter username
2. Enter password
3. click login
4. click my info
5. click Memberships
6. Select Membership as TOP
7.Select Payment of the subscription in charge of as Business
8. Subscription cost as 500
9. Coin as Rupiah India
10. table contains added record

*** Settings ***
Documentation

Resource    ../Resource/Base/CommonFunctionality.resource

Library     DataDriver      file=../test_data/orange_data.xlsx      sheet_name=AddEmercencyContact

Test Setup      Launch Browser And Navigate To URL
Test Teardown       Close Browser

Test Template       Verify Add Membership Template

*** Test Cases ***
TC1     Admin      admin123     CIMA      Company       1000       AUD      2022-03-17      2023-03-31
TC2     Admin      admin123     ACCA      Individual       5000       AUD      2022-03-19      2023-04-21

*** Keywords ***
Verify Add Membership Template
    [Arguments]     ${username}     ${password}     ${membership}       ${subcription_paid_by}       ${subscription_amount}     ${currency}     ${commence_date}    ${renewal_date}
    Input Text    id=txtUsername    ${username}
    Input Password    id=txtPassword    ${password}
    Click Element    id=btnLogin
    Click Element    id=menu_pim_viewMyDetails
    Click Element    link=Memberships
    Click Element    id=btnAddMembershipDetail
    Select From List By Label    id=membership_membership       ${membership}
    Select From List By Label    id=membership_subscriptionPaidBy       ${subcription_paid_by}
    Input Text    id=membership_subscriptionAmount    ${subscription_amount}
    Select From List By Value    id=membership_currency     ${currency}
    Input Text    id=membership_subscriptionCommenceDate    ${commence_date}
    Input Text    id=membership_subscriptionRenewalDate    ${renewal_date}
    Click Element    id=btnSaveMembership
    Table Should Contain    xpath=//table[@class='table hover']    ${membership}
    Table Should Contain    xpath=//table[@class='table hover']    ${subcription_paid_by}
    Table Should Contain    xpath=//table[@class='table hover']    ${commence_date}
    Table Should Contain    xpath=//table[@class='table hover']    ${renewal_date}