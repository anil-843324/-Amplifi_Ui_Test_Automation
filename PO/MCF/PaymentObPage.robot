*** Settings ***
Documentation     All the page objects and keywords of easy payment journey page
Library           SeleniumLibrary
Resource        ./Generic.robot

*** Variables ***




*** Keywords ***

Payment ob
    WaitTimeOut    //button[contains(text(),'Confirm payment details')]
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    2s
    Element Text Should Be    //button[contains(text(),'Confirm payment details')]    confirm payment details
    Click Button    //button[contains(text(),'Confirm payment details')]
