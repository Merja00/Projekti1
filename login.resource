*** Settings ***
Library         Browser

*** Variables ***
${LOGIN URL}           https://env-5369504.paas.datacenter.fi/
${VALID USER}          test@knowit.com
${VALID PWD}           Knowit123_

*** Keywords ***
Open browser to login page
    New browser        headless=False
    New page           ${LOGIN URL}
    #lisää tänne testaus onko otsikko ok

Accept cookies
    Click    id=adroll_allow_all
Press login button
    Click    body > nav > div > div.buttons > a.login

Type in valid username       
    Type text          //*[@id="username"]     ${VALID USER}

Type in username
    [Arguments]         ${username}           
    Type text          //*[@id="username"]     ${username}

Type in valid password
    Type text          //*[@id="password"]     ${VALID PWD}

Type in password
    [Arguments]        ${password}
    Type text          //*[@id="password"]     ${password}

Submit credentials
    Click    body > div.dialog.open > div.dialog-content > form > div.row > input

Welcome page should be open
    Get Title   ==     VibeCatch
    
Error page should be open
    Get text    body > div.dialog.open > div.dialog-content > form > div.form-error-container    ==    Check your username and password
    # tämmöinen tulee tehdä

New poll page should be open
    Get Text    h4.modal-title   ==     Create new
