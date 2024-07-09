*** Settings ***
Library    SeleniumLibrary
# Test Setup        OpenBroser    ${mcf_salesforce_login_url}    ${browser_name}
Test Teardown    Close Browser Session
Resource        resource.robot
Variables    Xpth.py
Variables    Utilites.py

*** Test Cases ***
Validate that Successful easy payment journey
    OpenBroser    ${mcf_salesforce_login_url}    ${headless_browser_firefox}
    Fill the login Form    username=${mcf_user_email_id}    password=${mcf_valid_password} 
    Navigate to easy payment page
    Make a payment
    Filling netbanking details    paymentConditon=Success
Validate that Unsuccessful easy payment journey
    OpenBroser    ${mcf_salesforce_login_url}    ${headless_browser_firefox}
    Fill the login Form    username=${mcf_user_email_id}    password=${mcf_valid_password} 
    Navigate to easy payment page
    Make a payment
    Filling netbanking details    Failed
Validate Organic Loan Application with Valid Test Data
    OpenBroser    ${mcf_url}    ${headless_browser_firefox}
    Navigat to loan application form
    Fill the loan form
*** Keywords ***
WaitTimeOut
    [Arguments]    ${xpath}
    Set Selenium Implicit Wait    20 sec
    Set Selenium Timeout    20 sec
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

Navigat to loan application form
    WaitTimeOut    ${cookie_XPATH}
    Click Button    ${cookie_XPATH}
    WaitTimeOut    ${loans_XPATH}
    Click Button    locator=${loans_XPATH}
    WaitTimeOut    ${getMypersonalisedQuote_XPATH}
    Execute Javascript    document.querySelectorAll("button.primary")[0].scrollIntoView(true)
    Sleep    2s
    Click Button    locator=${getMypersonalisedQuote_XPATH}
Fill the loan form
    WaitTimeOut    xpath=${useLoanFor_XPATH}
    Execute Javascript    document.querySelectorAll("label")[6].scrollIntoView(true)
    Click Element    locator=${useLoanFor_XPATH}

    Scroll Element Into View    //label[@for="loanPurposeOther"]
    Input Text    locator=${pleaseSpecify_XPATH}    text=Education

    Execute Javascript    document.querySelectorAll("label.sm-bold")[1].scrollIntoView(true)
    Click Element    //label[@for='mcf-radio-button-6']

    Execute Javascript    document.querySelectorAll("label.sm-bold")[2].scrollIntoView(true)
    Input Text    locator=${firstName_XPATH}    text=CHRISTIAN+${first_name}
    Execute Javascript    document.querySelectorAll("label.sm-bold")[2].scrollIntoView(true)
    Input Text    //input[@id="lastName"]    text=MCMASTER

    Execute Javascript    document.querySelectorAll("label.sm-bold")[4].scrollIntoView(true)
    Input Text    locator=${DD_XPATH}    text=20
    Input Text    locator=${MM_XPATH}    text=02
    Input Text    locator=${YYYY_XPATH}    text=1985

    Execute Javascript    document.querySelectorAll("label.sm-bold")[5].scrollIntoView(true)
    Sleep    2s
    Input Text    locator=${email_XPATH}    text=${random_email}
    Execute Javascript    document.querySelectorAll("label.sm-bold")[6].scrollIntoView(true)
    Input Text    locator=${mobileNumber_XPATH}    text=07712812773

    Execute Javascript    document.querySelectorAll("label.sm-bold")[7].scrollIntoView(true)
    Input Text    locator=${postCode_XPATH}    text=L9 2AA
    Execute Javascript    document.querySelectorAll("label.sm-bold")[7].scrollIntoView(true)
    Sleep    2s
    Click Button    locator=${findMyAddress_XPATH}
    Execute Javascript    document.querySelectorAll("label.sm-bold")[7].scrollIntoView(true)
    Select From List By Index    ${selectAddress_XPATH}    30

    Execute Javascript    document.querySelectorAll("label.sm-bold")[10].scrollIntoView(true)
    Click Element    ${whenDidYouMoveInMoreThanThree_XPATH}

    Execute Javascript    document.querySelectorAll("label.sm-bold")[11].scrollIntoView(true)
    Input Text    //input[@id="income"]    text=70000

    Execute Javascript    document.querySelectorAll("label.sm-bold")[12].scrollIntoView(true)
    Click Element    ${dependentOnYou_XPATH}

    Execute Javascript    document.querySelectorAll("label.sm-bold")[13].scrollIntoView(true)
    Select From List By Index    ${livingSituation_XPATH}    1

    Execute Javascript    document.querySelectorAll("label.sm-bold")[14].scrollIntoView(true)
    Input Text    ${rent_XPATH}    text=300

    Execute Javascript    document.querySelectorAll("label.sm-bold")[15].scrollIntoView(true)
    Select From List By Index    ${employmentStatus_XPATH}    1

    Execute Javascript    document.querySelectorAll("label.sm-bold")[16].scrollIntoView(true)
    Input Text    ${jobTitle_XPATH}    text=Account Director
    Execute Javascript    document.querySelectorAll("label.sm-bold")[16].scrollIntoView(true)
    Sleep    2s
    Press Key    ${jobTitle_XPATH}    \\13

    Execute Javascript    document.querySelectorAll("label.sm-bold")[17].scrollIntoView(true)
    Input Text    ${companyName_XPATH}    text=Gojoko

    Execute Javascript    document.querySelectorAll("label.sm-bold")[17].scrollIntoView(true)
    Sleep    2s
    Click Button    ${getMypersonalisedQuote_XPATH}
    Sleep    20s
    



