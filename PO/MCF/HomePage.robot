*** Settings ***
Documentation     All the page objects and keywords of organic loan application journey page
Library           SeleniumLibrary
Resource        ./Generic.robot
Variables    ../../Test/Xpth.py

*** Variables ***




*** Keywords ***

loans home 
    WaitTimeOut    ${cookie_XPATH}
    Click Button    ${cookie_XPATH}
    WaitTimeOut    ${loans_XPATH}
    Sleep    1s
    Execute Javascript    document.querySelectorAll("button")[1].scrollIntoView(true)
    Sleep    2s
    Click Button    locator=${loans_XPATH}

