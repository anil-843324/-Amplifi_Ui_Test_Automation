*** Settings ***
Documentation     All the page objects and keywords of easy payment journey page
Library           SeleniumLibrary
Resource        ../MCF/Generic.robot

*** Variables ***




*** Keywords ***

Fill the login Form
    [Arguments]    ${username}    ${password}
    WaitTimeOut    //input[@inputmode="email"]
    Input Text    //input[@inputmode="email"]    ${username}
    Input Password   //input[@placeholder="Enter your password"]    ${password}
    Click Button    //button[contains(@class,"login_btn")]
    Sleep    10s
