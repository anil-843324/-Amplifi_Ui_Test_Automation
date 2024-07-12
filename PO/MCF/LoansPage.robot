*** Settings ***
Documentation     All the page objects and keywords of organic loan application journey page
Library           SeleniumLibrary
Resource        ./Generic.robot
Variables    ../../Test/Xpth.py

*** Variables ***




*** Keywords ***

loans My Community Finance Bank
    WaitTimeOut    ${getMypersonalisedQuote_XPATH}
    Execute Javascript    document.querySelectorAll("button.primary")[0].scrollIntoView(true)
    Sleep    2s
    Click Button    locator=${getMypersonalisedQuote_XPATH}

