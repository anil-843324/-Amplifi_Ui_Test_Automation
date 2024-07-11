*** Settings ***
Documentation     All the page objects and keywords of easy payment journey page
Library           SeleniumLibrary
Resource        ./Generic.robot

*** Variables ***




*** Keywords ***

Select your bank
    WaitTimeOut    (//span[contains(@class,'order-first')])[2]
    Click Element    (//input[@type="radio"])[2]
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    1s
    Mouse Down    //span[contains(text(),'Continue')]
    Sleep    1s
    Mouse Up    //span[contains(text(),'Continue')]

