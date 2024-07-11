*** Settings ***
Documentation     All the page objects and keywords of easy payment journey page
Library           SeleniumLibrary
Resource        ../MCF/Generic.robot

*** Variables ***




*** Keywords ***

Customer landing loans applications
    WaitTimeOut    //button[@title="Go to loan overview"]
    Click Button    //button[@title="Go to loan overview"]
