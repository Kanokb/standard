*** Settings ***
Resource          SeleniumRedefineKeyword.robot

*** Keywords ***
Open Google
    [Arguments]    ${url}
    Open Browser   ${url}