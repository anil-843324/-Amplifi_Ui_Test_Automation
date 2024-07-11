*** Settings ***
Documentation     All the page objects and keywords of easy payment journey page
Library           SeleniumLibrary
Resource        ./Generic.robot

*** Variables ***




*** Keywords ***

Payment success
    WaitTimeOut    //button[@id="approveButton"]
    Click Button    //button[@id="approveButton"]
    Sleep    18s
    ${text}    Execute Javascript    return document.querySelectorAll("h5")[0].innerText
    Should Be Equal As Strings    ${text}    Payment completed
   


