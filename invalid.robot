*** Settings ***
Force Tags          Case2    login
Suite Setup         Open browser to login page
Test Template       Login with invalid credentials should fail
Suite Teardown      Close browser
Resource            login.resource

#datadriven testausta eli taulukko

*** Test Cases ***  USERNAME           PASSWORD

Invalid username    invalid@in.fi      ${VALID PWD}
Invalid password    ${VALID USER}      invalid 
Both invalid        invalid@in.fi      invalid
#all olevia ei voida ajaa, koska virheilmoitus on eri tai järjestelmä ilmoittaa, 
#että on yritetetty liian monta kertaa ja estää yritykset
#Empty username      ${EMPTY}           ${VALID PWD}  
#                    ${EMPTY}           invalid
#Empty password      ${VALID PWD}       ${EMPTY}
#Both empty          ${EMPTY}           ${EMPTY}

*** Keywords ***
Login with invalid credentials should fail
    Open browser to login page
    Accept cookies
    Press login button
    [Arguments]         ${username}         ${password}
    Type in username    ${username}
    Type in password    ${password}
    Submit credentials  
    Error page should be open
    #[Teardown]    Close All Browsers
    