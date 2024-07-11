*** Settings ***
Documentation     All the page objects and keywords of easy payment journey page
Library           SeleniumLibrary
Resource        ../MCF/Generic.robot

*** Variables ***




*** Keywords ***

Customer loans overivew schedule
    WaitTimeOut    //div[contains(@class,'mt-16')]//a
    Click Element    //div[contains(@class,'mt-16')]//a
