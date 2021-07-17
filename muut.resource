#tämän tiedoston nimi tulisi olla login.resource

*** Settings ***
Library            SeleniumLibrary

*** Variables ***
${LOGIN URL}       http://localhost:7272
${BROWSER}         Chrome
${VALID USER}      demo
${VALID PWD}       mode
 
*** Keywords ***
Open browser to login page
    Open browser    ${LOGIN URL}    ${BROWSER}
    Title should be    Login Page

Navigate to loging page
    Go to     ${LOGIN URL}
    Title should be    Login Page

Type in valid username
    Type in username    ${VALID USER}

Type in username
    [Arguments]    ${username}
    Input text    username_field    ${username}

Type in valid password
    Type in password    ${VALID PWD}

Type in password
    [Arguments]    ${password}
    Input password    password_field    ${password}

Submit credentials
    Click button    login_button

Welcome page should be open
    Title should be    Welcome Page

Error page should be open
    Title should be    Error Page
