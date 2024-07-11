*** Settings ***
Documentation     All the page objects and keywords of easy payment journey page
Library           SeleniumLibrary
Resource        ../MCF/Generic.robot

*** Variables ***
${customer_number}    123456789012
@{banking_pin}    5    7    2    4    3    6


*** Keywords ***

Filling netbanking details
    [Arguments]    ${paymentConditon}
    Sleep    14s
    Input Text    //input[@name="customer-number"]    text=${customer_number}
    Click Button    //button[@id="customer-number-login"]
    WaitTimeOut    (//div[contains(@class,'form-group')])[7]//input
    FOR    ${index}    IN RANGE    6
        Input Text    locator=(//div[contains(@class,'form-group')])[${index+7}]//input    text=${banking_pin}[${index}]
    END
    Click Button    //button[@id="login-button"]
    WaitTimeOut    (//button[contains(text(),'Select account')])[1]
    Click Button    (//button[contains(text(),'Select account')])[1]

