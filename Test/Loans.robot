*** Settings ***
Library    SeleniumLibrary
Test Setup        OpenBroser
Test Teardown    Close Browser Session
Resource        resource.robot


*** Test Cases ***
Validate that Successful easy payment journey
    Fill the login Form    username=${user_email_id}    password=${valid_password} 
    Navigate to easy payment page
    Make a payment
# Validate that Unsuccessful easy payment journey
#     Fill the login Form    username=${user_email_id}    password=${valid_password} 
#     Navigate to easy payment page
#     Make a payment

*** Keywords ***
WaitTimeOut
    [Arguments]    ${xpath}
    Set Selenium Implicit Wait    15 sec
    Set Selenium Timeout    15 sec
    Wait Until Page Contains Element    ${xpath}
    Wait Until Element Is Visible    ${xpath}
    Wait Until Element Is Enabled    ${xpath}
Fill the login Form
    [Arguments]    ${username}    ${password}
    WaitTimeOut    //input[@inputmode="email"]
    Input Text    //input[@inputmode="email"]    ${username}
    Input Password   //input[@placeholder="Enter your password"]    ${password}
    Click Button    //button[contains(@class,"login_btn")]
    Sleep    10s
    # Close Browser
    
Navigate to easy payment page
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
    # Execute Javascript    document.querySelectorAll("button.btn")[0].scrollIntoView(true)
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    2s
    Element Text Should Be    //button[contains(text(),'Confirm payment details')]    confirm payment details
    Click Button    //button[contains(text(),'Confirm payment details')]
    # Should Be Equal As Strings    "anil"    "Anil"
    # Element Text Should Be    //button[contains(text(),'Confirm payment details')]    Confirm payment details
    Sleep    10s


