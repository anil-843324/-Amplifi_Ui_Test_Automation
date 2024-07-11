*** Settings ***
Documentation     All the page objects and keywords of easy payment journey page
Library           SeleniumLibrary
Resource        ../MCF/Generic.robot

*** Variables ***
${arreras_amount}        100



*** Keywords ***

Make a payment card
    WaitTimeOut    //input[contains(@class,'input-border-with-mask')]
    Input Text    //input[contains(@class,'input-border-with-mask')]    ${arreras_amount}
    Click Button    //button[contains(@class,'btnLabel btn verify-btn')]