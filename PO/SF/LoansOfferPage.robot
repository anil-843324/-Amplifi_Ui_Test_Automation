*** Settings ***
Documentation     All the page objects and keywords of easy payment journey page
Library           SeleniumLibrary
Resource        ../MCF/Generic.robot
Library    ../../Test/Library/MyLibrary.py
*** Variables ***




*** Keywords ***

loans offer
    WaitTimeOut    //lightning-layout[contains(@class,'header')]
    ${actual_loan_offer}=    Get Location
    ${actual_loan_offer}    extract path segment    ${actual_loan_offer}
    Should Be Equal As Strings    ${actual_loan_offer}    loan-offer