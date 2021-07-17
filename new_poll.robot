*** Settings ***
Force Tags     Case3    poll    
Resource       login.resource    

*** Test Cases ***
Create a new poll
    Open browser to login page
    Accept cookies
    Press login button
    Type in valid username
    Type in valid password
    Submit credentials
    Click    //*[@id="masterContainer"]/vibe-list/div[4]/div/a/i
    New poll page should be open

    
