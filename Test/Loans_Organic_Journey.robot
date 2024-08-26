# *** Settings ***
# Library    SeleniumLibrary
# Test Teardown    Close Browser Session
# Resource        ../PO/MCF/Generic.robot
# Variables    Xpth.py
# Variables    Utilities.py
# Library    DataDriver    file=resources/ValidDRSTESTDATA.xlsx    sheet_name=Sheet1
# Test Template    Validate Organic Loan Application with Valid Test Data
# Library    DateTime
# Library    String
# Resource    ../PO/MCF/HomePage.robot
# Resource    ../PO/MCF/LoansPage.robot
# Resource    ../PO/MCF/LoansApplyPage.robot
# Resource    ../PO/SF/LoansOfferPage.robot

# *** Test Cases ***
# Validate Organic Loan Application ${Title} ${Forename} ${Surname} ${DOB} ${Employment_Sector} ${Date_Of_Entry_On_Test_Database} ${Original_Dob} ${Phone_Number} ${Postcode} ${loanval} ${loanterm} ${RentOrMortgage} ${annualgrossincome} ${Employer} ${EmploymentStatus} ${Purpose} ${PurposeIfOther} ${Outgoings} ${FullAddress} ${AddressIndex}

# *** Variables ***
# ${DASH}    -

# *** Keywords ***
# Validate Organic Loan Application with Valid Test Data
#     [Arguments]    ${Title}    ${Forename}    ${Surname}    ${DOB}    ${Employment_Sector}    ${Date_Of_Entry_On_Test_Database}    ${Original_Dob}    ${Phone_Number}    ${Postcode}    ${loanval}    ${loanterm}    ${RentOrMortgage}    ${annualgrossincome}    ${Employer}    ${EmploymentStatus}    ${Purpose}    ${PurposeIfOther}    ${Outgoings}    ${FullAddress}    ${AddressIndex}   
#     OpenBroser    ${mcf_url}    ${headless_browser_firefox}
#     loans home 
#     loans My Community Finance Bank
#     Filling loans form    ${Title}    ${Forename}    ${Surname}    ${DOB}    ${Employment_Sector}    ${Date_Of_Entry_On_Test_Database}    ${Original_Dob}    ${Phone_Number}    ${Postcode}    ${loanval}    ${loanterm}    ${RentOrMortgage}    ${annualgrossincome}    ${Employer}    ${EmploymentStatus}    ${Purpose}    ${PurposeIfOther}    ${Outgoings}    ${FullAddress}    ${AddressIndex}
#     loans offer
