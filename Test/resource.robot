*** Settings ***
Documentation    A resource file with resusable keywords and variables. 
...              The system specific keywords created here form our own domain specifi language. 
...              They utilize keywords provided by the imported SeleniumLibrary.
Library    SeleniumLibrary



*** Variables ***
${user_email_id}         priya.gojoko2811+34@gmail.com
${valid_password}         Test@1234
${invalid_password}         Test@1234
${arreras_amount}        100
${salesforce_login_url}        https://uat.customer.mycommunityfinance.co.uk/s/login/
${browser_name}        Firefox
${headless_browser_firefox}    headlessfirefox
${headless_browser_chrome}    headlesschrome

*** Keywords ***
OpenBroser
    [Arguments]    ${url}    ${browser}
    Open Browser        ${url}    ${browser}
    Maximize browser window

Close Browser Session
    Close Browser
# wait until Element is visible
#     # Wait Until Element Is Visible   
#     Close Browser 