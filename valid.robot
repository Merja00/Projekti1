*** Settings ***
Force Tags        Case1    login
Default Tags      VibeCatch
Resource          login.resource


*** Test Cases ***
Valid login
    [Tags]     overrides default
    #Skip If    platform.system() == 'Linux'
    Open browser to login page
    Accept cookies
    Press login button
    Type in valid username
    Type in valid password
    Submit credentials
    Welcome page should be open
    #[Teardown]    Close browser
    
