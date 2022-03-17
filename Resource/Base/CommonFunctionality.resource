*** Settings ***
Documentation   this file handles browser

Library     SeleniumLibrary
*** Variables ***
${BROWSER_NAME}     chrome
${URL}      https://opensource-demo.orangehrmlive.com/

*** Keywords ***
Launch Browser and navigate to url
    Open Browser        browser=${BROWSER_NAME}      executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Go To    url=${URL}

