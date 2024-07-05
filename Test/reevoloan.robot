*** Settings ***
Library    SeleniumLibrary
Test Setup        OpenBroser    https://uat.reevomoney.com/    browser=${headless_browser_firefox}
Test Teardown    Close Browser Session
Resource        resource.robot
Variables    Xpth.py


*** Test Cases ***
# Validate that Successful easy payment journey
#     Fill the login Form    username=${reevo_user_email_id}    password=${reevo_valid_password} 
#     Navigate to easy payment page
#     Make a payment
# Validate that Unsuccessful easy payment journey
#     Fill the login Form    username=${user_email_id}    password=${valid_password} 
#     Navigate to easy payment page
#     Make a payment
Validate that loan journey with valid data
    Fill the loan applicaiton form

*** Keywords ***

Fill the login Form
    [Arguments]    ${username}    ${password}
    WaitTimeOut    //button
    Click Button    //button
    WaitTimeOut    //input[@placeholder="Enter your email..."]
    Input Text    //input[@placeholder="Enter your email..."]    ${username}
    Input Password   //input[@data-name="passwordInput"]    ${password}
    Click Button    //button[contains(@class,"slds-button")]
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
    WaitTimeOut    //button[contains(text(),'Confirm payment detail')]
    # Execute Javascript    document.querySelectorAll("button.btn")[0].scrollIntoView(true)
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep    2s
    Element Text Should Be    //button[contains(text(),'Confirm payment detail')]    confirm payment detail
    Click Button    //button[contains(text(),'Confirm payment detail')]
    # Should Be Equal As Strings    "anil"    "Anil"
    # Element Text Should Be    //button[contains(text(),'Confirm payment details')]    Confirm payment details
    Sleep    10s


Fill the loan applicaiton form
    WaitTimeOut    xpath=${getMypersonalisedQuote_XPATH}
    Execute Javascript    document.querySelectorAll("button")[2].scrollIntoView(true)
    Click Button    locator=${getMypersonalisedQuote_XPATH}

    WaitTimeOut    xpath=${useLoanFor_XPATH}
    Execute Javascript    document.querySelectorAll("label")[6].scrollIntoView(true)
    Click Element    locator=${useLoanFor_XPATH}

    Scroll Element Into View    //label[@for="loanPurposeOther"]
    Input Text    locator=${pleaseSpecify_XPATH}    text=Education

    Execute Javascript    document.querySelectorAll("label.md-regular")[6].scrollIntoView(true)
    Click Element    locator=${yourTitle_XPATH}

    Execute Javascript    document.querySelectorAll("label")[6].scrollIntoView(true)
    Input Text    locator=${firstName_XPATH}    text=Anil
    Input Text    locator=${lastName_XPATH}    text=Kumar

    Execute Javascript    document.querySelectorAll("input")[12].scrollIntoView(true)
    Input Text    locator=${DD_XPATH}    text=12
    Input Text    locator=${MM_XPATH}    text=12
    Input Text    locator=${YYYY_XPATH}    text=2000

    Input Text    locator=${email_XPATH}    text=anil@yopmail.com
    Input Text    locator=${mobileNumber_XPATH}    text=7255842110

    Input Text    locator=${postCode_XPATH}    text=NW4 3AB
    Click Button    locator=${findMyAddress_XPATH}
    Select From List By Index    ${selectAddress_XPATH}    10
    # Select From List By Value    ${selectAddress_XPATH}    ${address}
    
    



    
      