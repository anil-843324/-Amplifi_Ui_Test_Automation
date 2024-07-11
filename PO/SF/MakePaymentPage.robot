*** Settings ***
Documentation     All the page objects and keywords of easy payment journey page
Library           SeleniumLibrary
Resource        ../MCF/Generic.robot

*** Variables ***




*** Keywords ***

Make a payment
    WaitTimeOut    (//div[contains(@class,'paymentHeading')])[1]
    Sleep    7s
    Click Element    (//div[contains(@class,'paymentHeading')])[1]
