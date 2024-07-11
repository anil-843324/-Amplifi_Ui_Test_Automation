*** Settings ***
Library    SeleniumLibrary
Resource        ../PO/MCF/Generic.robot
Test Teardown    Close Browser Session
Resource        ../PO/MCF/PaymentFailPage.robot
Resource        ../PO/MCF/PaymentObPage.robot
Resource        ../PO/MCF/PaymentSuccessPage.robot
Resource        ../PO/MCF/SelectYourBankPage.robot

Resource        ../PO/NetBanking/RoyalBankOfScotlanpag.robot

Resource        ../PO/SF/LandingCustomerLoansPage.robot
Resource        ../PO/SF/LoanOverviewsPage.robot
Resource        ../PO/SF/LoginPage.robot
Resource        ../PO/SF/MakePaymentCardPage.robot
Resource        ../PO/SF/MakePaymentPage.robot


*** Test Cases ***
Validate that Successful easy payment journey
    OpenBroser    ${mcf_salesforce_login_url}    ${firefox_browser}
    Fill the login Form    username=${mcf_user_email_id}    password=${mcf_valid_password} 
    Customer landing loans applications
    Customer loans overivew schedule
    Make a payment
    Make a payment card
    Payment ob
    Select your bank
    Payment success

Validate that Unsuccessful easy payment journey
    OpenBroser    ${mcf_salesforce_login_url}    ${firefox_browser}
    Fill the login Form    username=${mcf_user_email_id}    password=${mcf_valid_password} 
    Customer landing loans applications
    Customer loans overivew schedule
    Make a payment
    Make a payment card
    Payment ob
    Select your bank
    Payment fail


