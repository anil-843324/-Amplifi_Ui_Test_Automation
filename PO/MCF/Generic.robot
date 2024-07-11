*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary



*** Variables ***
${mcf_user_email_id}         priya.gojoko2811+34@gmail.com
${mcf_valid_password}         Test@1234

${reevo_user_email_id}         priya.gojoko2811+41@gmail.com
${reevo_valid_password}         Test@12345


${mcf_salesforce_login_url}        https://uat.customer.mycommunityfinance.co.uk/s/login/
${reevo_salesforce_login_url}        https://uat.customer.reevomoney.com/s/login/
${mcf_url}    https://uat.mycommunityfinance.co.uk/

${firefox_browser}        Firefox
${headless_browser_firefox}    headlessfirefox
${headless_browser_chrome}    headlesschrome

*** Keywords ***
OpenBroser
    [Arguments]    ${url}    ${browser_mode}
    Open Browser        ${url}   ${browser_mode}
    Maximize browser window

Close Browser Session
    Close Browser
WaitTimeOut
    [Arguments]    ${xpath}
    Set Selenium Implicit Wait    59 sec
    Set Selenium Timeout    59 sec
    Wait Until Page Contains Element    ${xpath}
    Wait Until Element Is Visible    ${xpath}
    Wait Until Element Is Enabled    ${xpath}