*** Settings ***
Library    SeleniumLibrary
# Test Setup        OpenBroser    ${mcf_salesforce_login_url}    ${browser_name}
Test Teardown    Close Browser Session
Resource        resource.robot
Variables    Xpth.py
Variables    Utilities.py



*** Test Cases ***
Validate that Successful easy payment journey
    OpenBroser    ${mcf_salesforce_login_url}    ${browser_name}
    Fill the login Form    username=${mcf_user_email_id}    password=${mcf_valid_password} 
    Navigate to easy payment page
    Make a payment
    Filling netbanking details    paymentConditon=Success
Validate that Unsuccessful easy payment journey
    OpenBroser    ${mcf_salesforce_login_url}    ${browser_name}
    Fill the login Form    username=${mcf_user_email_id}    password=${mcf_valid_password} 
    Navigate to easy payment page
    Make a payment
    Filling netbanking details    Failed


*** Keywords ***
WaitTimeOut
    [Arguments]    ${xpath}
    Set Selenium Implicit Wait    30 sec
    Set Selenium Timeout    30 sec
    Wait Until Page Contains Element    ${xpath}
    Wait Until Element Is Visible    ${xpath}
    Wait Until Element Is Enabled    ${xpath}
Fill the login Form
    [Arguments]    ${username}    ${password}
    Log    Starting Fill the login Form with username: ${username}    INFO
    WaitTimeOut    //input[@inputmode="email"]
    Input Text    //input[@inputmode="email"]    ${username}
    Input Password   //input[@placeholder="Enter your password"]    ${password}
    Click Button    //button[contains(@class,"login_btn")]
    Sleep    10s
    
Navigate to easy payment page
    Log    Navigating to the easy payment page
    Click Button    //button[@title="Go to loan overview"]
    WaitTimeOut    //div[contains(@class,'mt-16')]//a
    Click Element    //div[contains(@class,'mt-16')]//a
Make a payment
    WaitTimeOut    (//div[contains(@class,'paymentHeading')])[1]
    Sleep    7s
    Click Element    (//div[contains(@class,'paymentHeading')])[1]
    Input Text    //input[contains(@class,'input-border-with-mask')]    ${arreras_amount}
    Click Button    //button[contains(@class,'btnLabel btn verify-btn')]
    WaitTimeOut    //button[contains(text(),'Confirm payment details')]
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    2s
    Element Text Should Be    //button[contains(text(),'Confirm payment details')]    confirm payment details
    Click Button    //button[contains(text(),'Confirm payment details')]
    WaitTimeOut    (//span[contains(@class,'order-first')])[2]
    Click Element    (//input[@type="radio"])[2]
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    1s
    Mouse Down    //span[contains(text(),'Continue')]
    Sleep    1s
    Mouse Up    //span[contains(text(),'Continue')]
    

Filling netbanking details
    # WaitTimeOut    //label[contains(text(),'Online banking')]
    [Arguments]    ${paymentConditon}
    Sleep    14s
    Input Text    //input[@name="customer-number"]    text=123456789012
    Click Button    //button[@id="customer-number-login"]
    WaitTimeOut    (//div[contains(@class,'form-group')])[7]//input
    FOR    ${index}    IN RANGE    6
        Input Text    locator=(//div[contains(@class,'form-group')])[${index+7}]//input    text=${input_values}[${index}]
    END
    Click Button    //button[@id="login-button"]
    WaitTimeOut    (//button[contains(text(),'Select account')])[1]
    Click Button    (//button[contains(text(),'Select account')])[1]
    
    IF    '${paymentConditon}' == 'Success'
        Click Button    //button[@id="approveButton"]
        Sleep    18s
        ${text}    Execute Javascript    return document.querySelectorAll("h5")[0].innerText
        Should Be Equal As Strings    ${text}    Payment completed
    ELSE
        Click Button    //button[@id="declineButton"]
        Sleep    18s
        ${text}    Execute Javascript    return document.querySelectorAll("h5")[0].innerText
        Should Be Equal As Strings    ${text}    Not successful
    END