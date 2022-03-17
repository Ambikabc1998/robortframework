*** Settings ***
Documentation   this file handles browser

Library     SeleniumLibrary

*** Keywords ***

Launch Browser and navigate to url
    Open Browser        browser=chrome      executable_path=${EXECDIR}${/}driver${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Go To    url=https://opensource-demo.orangehrmlive.com/
