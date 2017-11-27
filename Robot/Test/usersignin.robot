*** Settings ***
Documentation  User Sign Up
Library  Selenium2Library

*** Variables ***
${UserEmail}  webambassador@mailinator.com
${UserPassoword}  Testing!23
${Browser}  Chrome
${SiteUrl}  http://35.166.59.196:8081
${SignIn}  //div[17]/div[1]/div/div[2]/ul/li[2]/strong/a
${x}  //*[@id="signin-modal-open"]/button
${SignInPage}  id=modal-login-form
${SignUpUser}  //*[@id="loginform-username"]
${SignUpPassword}  //*[@id="loginform-password"]
${SignInButton}  //*[@id="modal-login-form"]/div[4]/div[1]/input


*** Test Cases ***

User can Open Bodies
    [Documentation]  User Can Open Bodies Website
    Open Chrome With Options
    go to  ${SiteUrl}
User can click Sign In Link
    [Documentation]  Click Sign In Link
    click element  ${SignIn}
    wait until element is visible  ${x}
    wait until element is visible  ${SignUpUser}
    wait until element is visible  ${SignUpPassword}
    wait until element is visible  ${SignInButton}
Specify Email and Password
    input text  ${SignUpUser}  ${UserEmail}
    input password  ${SignUpPassword}  ${UserPassoword}
Sign In
    click element  ${SignInButton}
Verification
    wait until page contains  ${UserEmail}


*** Keywords ***
Open Chrome With Options
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${options}    add_argument      start-maximized
    Call Method    ${options}    add_argument      disable-extensions
    Create WebDriver  Chrome    chrome_options=${options}
