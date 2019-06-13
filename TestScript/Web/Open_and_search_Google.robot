*** Settings ***
Resource          ../../Resource/Keywords/SeleniumRedefineKeyword.robot
Resource          ../../Resource/Keywords/Open_and_search_Google_Keywords.robot
Library           Selenium2Library
Library           BuiltIn
Library           Collections
Library           DateTime
Library           Process
Library           Selenium2Library
Library           String
Library           OperatingSystem
Library           AutoItLibrary

*** Test Cases ***
#case1
    #Open Google    https://www.google.co.th/
    Open Google   https://www.google.co.th/
    Input Web Text    ${textbox_Google}    Robot Framework
    Click Web Element    ${button_googlesearch}
    Click Web Element    ${text_robotframework}
    sleep    10s
