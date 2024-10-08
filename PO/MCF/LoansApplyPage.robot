*** Settings ***
Library    SeleniumLibrary
Resource        ./Generic.robot
Variables    ../../Test/Xpth.py
Variables    ../../Test/Utilities.py
Library    DataDriver    file=../../Test/resources/ValidDRSTESTDATA.xlsx   sheet_name=Sheet1
Library    DataDriver    file=resources/ValidDRSTESTDATA.xlsx   sheet_name=Sheet1

Library    DateTime
Library    String
Library    ../../Test/Library/MyLibrary.py


*** Variables ***
${DASH}    -

*** Keywords ***
Filling loans form
    [Arguments]    ${Title}    ${Forename}    ${Surname}    ${DOB}    ${Employment_Sector}    ${Date_Of_Entry_On_Test_Database}    ${Original_Dob}    ${Phone_Number}    ${Postcode}    ${loanval}    ${loanterm}    ${RentOrMortgage}    ${annualgrossincome}    ${Employer}    ${EmploymentStatus}    ${Purpose}    ${PurposeIfOther}    ${Outgoings}    ${FullAddress}    ${AddressIndex}   
    ${date_parts}    Split String    ${DOB}    ${SPACE}    
    ${date}    Split String    ${date_parts[0]}    ${DASH}   
    Log To Console    ${Forename}  ${Surname}
    WaitTimeOut    ${editButton_XPATH}
    Sleep    2s
    Click Element   locator=${editButton_XPATH}
    
    WaitTimeOut    ${borrowLoanAmount_XPATH}
    Sleep    1s
    Clear Element Text    ${borrowLoanAmount_XPATH}
    ${value}=    Get Value    ${borrowLoanAmount_XPATH}
    ${text_lenght}=    Get Length      ${value}
    Run Keyword If    '${value}' != ''
    ...     Repeat Keyword  ${text_lenght}  Press Key  ${borrowLoanAmount_XPATH}   \\08     #\\08 - Delete
    Sleep    1s
    Input Text    ${borrowLoanAmount_XPATH}    text=${loanval}

    WaitTimeOut    ${selectLoanMonths_XPATH}
    Select From List By Index    ${selectLoanMonths_XPATH}    1

    WaitTimeOut    xpath=${useLoanFor_XPATH}
    Execute Javascript    document.querySelectorAll("label")[6].scrollIntoView(true)
    Sleep    2s
    Click Element    locator=${useLoanFor_XPATH}

    Scroll Element Into View    //label[@for="loanPurposeOther"]
    Input Text    locator=${pleaseSpecify_XPATH}    text=${PurposeIfOther}

    Execute Javascript    document.querySelectorAll("label.sm-bold")[1].scrollIntoView(true)
    Click Element    //label[@for='mcf-radio-button-6']

    Execute Javascript    document.querySelectorAll("label.sm-bold")[2].scrollIntoView(true)
    Input Text    locator=${firstName_XPATH}    text=${Forename}${first_name}
    Execute Javascript    document.querySelectorAll("label.sm-bold")[2].scrollIntoView(true)
    Input Text    //input[@id="lastName"]    text=${Surname}

    Execute Javascript    document.querySelectorAll("label.sm-bold")[4].scrollIntoView(true)
    Input Text    locator=${DD_XPATH}    text=${date[2]}
    Input Text    locator=${MM_XPATH}    text= ${date[1]} 
    Input Text    locator=${YYYY_XPATH}    text=${date[0]} 
    
    Execute Javascript    document.querySelectorAll("label.sm-bold")[5].scrollIntoView(true)
    Sleep    2s
    Input Text    locator=${email_XPATH}    text=${random_email}
    Execute Javascript    document.querySelectorAll("label.sm-bold")[6].scrollIntoView(true)
    Input Text    locator=${mobileNumber_XPATH}    text=${Phone_Number}

    Execute Javascript    document.querySelectorAll("label.sm-bold")[7].scrollIntoView(true)
    Input Text    locator=${postCode_XPATH}    text=${Postcode}
    Execute Javascript    document.querySelectorAll("label.sm-bold")[7].scrollIntoView(true)
    Sleep    2s
    Click Button    locator=${findMyAddress_XPATH}
    Execute Javascript    document.querySelectorAll("label.sm-bold")[7].scrollIntoView(true)
    Select From List By Index    ${selectAddress_XPATH}    ${AddressIndex}

    Execute Javascript    document.querySelectorAll("label.sm-bold")[10].scrollIntoView(true)
    Click Element    ${whenDidYouMoveInMoreThanThree_XPATH}

    Execute Javascript    document.querySelectorAll("label.sm-bold")[11].scrollIntoView(true)
    Input Text    //input[@id="income"]    text=${annualgrossincome}

    Execute Javascript    document.querySelectorAll("label.sm-bold")[12].scrollIntoView(true)
    Click Element    ${dependentOnYou_XPATH}

    Execute Javascript    document.querySelectorAll("label.sm-bold")[13].scrollIntoView(true)
    Select From List By Index    ${livingSituation_XPATH}    1

    Execute Javascript    document.querySelectorAll("label.sm-bold")[14].scrollIntoView(true)
    Input Text    ${rent_XPATH}    text=${RentOrMortgage}

    Execute Javascript    document.querySelectorAll("label.sm-bold")[15].scrollIntoView(true)
    Select From List By Index    ${employmentStatus_XPATH}    1

    Execute Javascript    document.querySelectorAll("label.sm-bold")[16].scrollIntoView(true)
    Input Text    ${jobTitle_XPATH}    text=${Employment_Sector}
    Execute Javascript    document.querySelectorAll("label.sm-bold")[16].scrollIntoView(true)
    Sleep    2s
    Press Key    ${jobTitle_XPATH}    \\13

    Execute Javascript    document.querySelectorAll("label.sm-bold")[17].scrollIntoView(true)
    Input Text    ${companyName_XPATH}    text=${Employer}

    Execute Javascript    document.querySelectorAll("label.sm-bold")[17].scrollIntoView(true)
    Sleep    2s
    Click Button    ${getMypersonalisedQuote_XPATH}
    Sleep    2s



    





  

    





  