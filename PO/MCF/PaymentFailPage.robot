*** Settings ***
Documentation     All the page objects and keywords of easy payment journey page
Library           SeleniumLibrary
Resource        ./Generic.robot

*** Variables ***




*** Keywords ***

Payment fail
    WaitTimeOut    //button[@id="declineButton"]
    Click Button    //button[@id="declineButton"]
    Sleep    18s
    ${text}    Execute Javascript    return document.querySelectorAll("h5")[0].innerText
    Should Be Equal As Strings    ${text}    Not successful


