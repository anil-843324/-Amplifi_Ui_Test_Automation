*** Settings ***
Documentation    A resource file with resusable keywords and variables. 
...              The system specific keywords created here form our own domain specifi language. 
...              They utilize keywords provided by the imported SeleniumLibrary.
Library    SeleniumLibrary



*** Variables ***
${mcf_user_email_id}         priya.gojoko2811+34@gmail.com
${mcf_valid_password}         Test@1234
@{input_values}    5    7    2    4    3    6
${reevo_user_email_id}         priya.gojoko2811+41@gmail.com
${reevo_valid_password}         Test@12345

${invalid_password}         Test@1234
${arreras_amount}        100
${mcf_salesforce_login_url}        https://uat.customer.mycommunityfinance.co.uk/s/login/
${reevo_salesforce_login_url}        https://uat.customer.reevomoney.com/s/login/
${browser_name}        Firefox
${headless_browser_firefox}    headlessfirefox
${headless_browser_chrome}    headlesschrome

${address}       "57 Ashdale Road Walton Liverpool L9 2AA"
*** Keywords ***
OpenBroser
    [Arguments]    ${url}    ${browser_mode}
    Open Browser        ${url}   ${browser_mode}
    Maximize browser window

Close Browser Session
    Close Browser
WaitTimeOut
    [Arguments]    ${xpath}
    Set Selenium Implicit Wait    15 sec
    Set Selenium Timeout    15 sec
    Wait Until Page Contains Element    ${xpath}
    Wait Until Element Is Visible    ${xpath}
    Wait Until Element Is Enabled    ${xpath}

# Open Headless Browser
#     [Arguments]    ${url} 
#     Open Browser    ${url}    browser=${headless_browser_firefox}

# Open Normal Browser
#     [Arguments]    ${url}
#     Open Browser    ${url}    browser=${browser_name}