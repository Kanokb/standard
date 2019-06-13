*** Settings ***
Library           Selenium2Library
Library           BuiltIn
Library           Collections
Library           DateTime
Library           Process
Library           Selenium2Library
Library           String
Library           OperatingSystem
Library           AutoItLibrary
Resource          ../Config/GlobalConfig.robot
Resource          ../Config/LocalConfig.robot
Resource          ../Repository/Common_Repository.robot
Resource          ../Repository/Page_Repository.robot
Resource          ../Variable/Common_Variable.robot
Resource          ../Variable/Page_Variable.robot
Resource          ../Variable/Specific_Variable.robot

*** Keywords ***
Click Web Element
    [Arguments]    ${Locator}    ${Index}=None    ${Timeout}=${maxTimeOut}
    [Documentation]    *Click Web Element*
    ...
    ...    *Example*
    ...    | Click Web Element | ${Locator} | ${Timeout}=${maxTimeOut} |
    ${Result}    BuiltIn.Run Keyword And Return Status    Selenium2Library.Wait Until Page Contains Element    ${Locator}    ${Timeout}
    BuiltIn.Run Keyword If    ${Result}==${True}    Web Element Should Be Visible    ${Locator}    ${Timeout}
    Selenium2Library.Click Element    ${Locator}

Delete All Directory
    [Arguments]    ${Path}
    [Documentation]    *Delete All Directory*
    ...
    ...    *Example*
    ...    | Delete All Directory | ${Path} |
    ...    | Delete All Directory | D:\\ |
    ${Count}    OperatingSystem.Count Directories In Directory    ${Path}
    @{FileList}=    OperatingSystem.List Directories In Directory    ${Path}
    : FOR    ${i}    IN RANGE    0    ${Count}
    \    Exit For Loop If    '${Count}' == '0'
    \    log    ${Path}@{FileList}[${i}]
    \    Remove Directory    ${Path}@{FileList}[${i}]    recursive=True
    Log    Delete All File From ${Path} Suscess

Delete All File
    [Arguments]    ${Path}
    [Documentation]    *Delete All File*
    ...
    ...    *Example*
    ...    | Delete All File| ${Path} |
    ...    | Delete All File| D:\\ |
    ${Count}    OperatingSystem.Count Files In Directory    ${Path}
    @{FileList}=    OperatingSystem.List Files In Directory    ${Path}
    : FOR    ${i}    IN RANGE    0    ${Count}
    \    Exit For Loop If    '${Count}' == '0'
    \    log    ${Path}@{FileList}[${i}]
    \    Wait Until Keyword Succeeds    5x    1s    Remove File    ${Path}@{FileList}[${i}]
    \    Remove File    ${Path}@{FileList}[${i}]
    Log    Delete All File From ${Path} Suscess

Delete File In Directory
    [Arguments]    ${FileName}
    [Documentation]    *Delete All File In Directory*
    ...
    ...    *Example*
    ...    | Delete All File In Directory| ${Path} |
    ...    | Delete All File In Directory| D:\\ |
    ${StatusFile}    Run Keyword And Return Status    OperatingSystem.File Should Exist    ${PathDownloadFile}${FileName}
    Run Keyword If    '${StatusFile}' == 'True'    BuiltIn.Wait Until Keyword Succeeds    5x    2s    BuiltIn.Run Keywords    OperatingSystem.Remove File
    ...    ${PathDownloadFile}${FileName}*
    ...    AND    OperatingSystem.Wait Until Removed    ${PathDownloadFile}${FileName}
    ${Result}=    BuiltIn.Run Keyword And Return Status    OperatingSystem.File Should Not Exist    ${PathDownloadFile}${FileName}
    BuiltIn.Should Be Equal    ${Result}    ${True}

Double Click Web Element
    [Arguments]    ${Locator}    ${Index}=None    ${Timeout}=${maxTimeOut}
    [Documentation]    *Click Web Element*
    ...
    ...    *Example*
    ...    | Click Web Element | ${Locator} | ${Timeout}=${maxTimeOut} |
    ${Result}    BuiltIn.Run Keyword And Return Status    Selenium2Library.Wait Until Page Contains Element    ${Locator}    ${Timeout}
    BuiltIn.Run Keyword If    ${Result}==${True}    Web Element Should Be Visible    ${Locator}    ${Timeout}
    Selenium2Library.Double Click Element    ${Locator}

Get Web Text
    [Arguments]    ${Locator}    ${Timeout}=${maxTimeOut}
    [Documentation]    Get text by returns the text value of element.
    ...
    ...    *Format keyword*
    ...
    ...    Get Web Text | ${Locator} | ${Timeout}=${maxTimeOut}
    ${Result}    BuiltIn.Run Keyword And Return Status    Selenium2Library.Wait Until Page Contains Element    ${Locator}    ${Timeout}
    BuiltIn.Run Keyword If    ${Result}==${True}    Web Element Should Be Visible    ${Locator}    ${Timeout}
    ${Text}    Selenium2Library.Get Text    ${Locator}
    [Return]    ${Text}

Get Web Value
    [Arguments]    ${Locator}    ${Timeout}=${maxTimeOut}
    [Documentation]    Get value by returns the value of element.
    ...
    ...
    ...    *Format keyword*
    ...
    ...    Get Web Value | ${Locator} | ${Timeout}=${maxTimeOut}
    ${Result}    BuiltIn.Run Keyword And Return Status    Selenium2Library.Wait Until Page Contains Element    ${Locator}    ${Timeout}
    BuiltIn.Run Keyword If    ${Result}==${True}    Web Element Should Be Visible    ${Locator}    ${Timeout}
    ${valueActual}    Selenium2Library.Get Value    ${Locator}
    [Return]    ${valueActual}

Input Web Text
    [Arguments]    ${Locator}    ${Text}    ${Timeout}=${maxTimeOut}
    [Documentation]    input text into text field identified by locator.
    ...
    ...
    ...    *Format keyword*
    ...
    ...    Input Web Text | ${Locator} | ${Text} | ${Timeout}=${maxTimeOut}
    ${Result}    BuiltIn.Run Keyword And Return Status    Selenium2Library.Wait Until Page Contains Element    ${Locator}    ${Timeout}
    BuiltIn.Run Keyword If    ${Result}==${True}    Web Element Should Be Visible    ${Locator}    ${Timeout}
    Comment    Selenium2Library.Input Text    ${Locator}    ${Text}
    Wait Until Keyword Succeeds    5x    1s    Selenium2Library.Input Text    ${Locator}    ${Text}

Select From Web List By Index
    [Arguments]    ${Locator}    ${Index}    ${Timeout}=${maxTimeOut}
    Web Element Should Be Visible    ${Locator}    ${Timeout}
    Wait Until Keyword Succeeds    5    1    Selenium2Library.Select From List By Index    ${Locator}    ${Index}

Select From Web List By Label
    [Arguments]    ${Locator}    ${Label}    ${Timeout}=${maxTimeOut}
    [Documentation]    Select item by using label from dropdownlist identified by locator.
    ...
    ...
    ...    *Format keyword*
    ...
    ...    Select From Web List By Label | ${Locator} | ${Label} | ${Timeout}=${maxTimeOut}
    Web Element Should Be Visible    ${Locator}    ${Timeout}
    Wait Until Keyword Succeeds    5    1    Selenium2Library.Select From List By Label    ${Locator}    ${Label}
    Wait Until Keyword Succeeds    5    1    Selenium2Library.List Selection Should Be    ${Locator}    ${Label}

Select From Web List By Value
    [Arguments]    ${Locator}    ${Value}    ${Timeout}=${maxTimeOut}
    [Documentation]    Select item by using value from dropdownlist identified by locator.
    ...
    ...
    ...    *Format keyword*
    ...
    ...    Select From Web List By Value | ${Value} | ${Label} | ${Timeout}=${maxTimeOut}
    Web Element Should Be Visible    ${Locator}    ${Timeout}
    Selenium2Library.Select From List By Value    ${Locator}    ${Value}

Unzip File
    [Arguments]    ${PathZipFile}    ${ExtractTo}
    [Documentation]    Keyword Unzip File Will wait ZipFile download success and Extract File to Path
    ...
    ...
    ...    *Format keyword*
    ...
    ...    Unzip File | ${PathZipFile} | ${ExtractTo}
    ...
    ...    1. ${PathZipFile} =D:\\FileDevPortal\\Test.zip
    ...    2. ${ExtractTo} = D:\\FileDevPortal\\Test
    OperatingSystem.Wait Until Created    ${PathZipFile}
    BuiltIn.Wait Until Keyword Succeeds    10x    1s    OperatingSystem.File Should Exist    ${PathZipFile}
    ArchiveLibrary.Extract Zip File    ${PathZipFile}    dest=${ExtractTo}

Upload File
    [Arguments]    ${Locator}    ${FileName}    ${Path}=${CURDIR}\\..\\PageFile\\
    [Documentation]    "Locator" is Locator of Button which will be clicked for uploading file
    ...
    ...
    ...    *Format keyword*
    ...
    ...    Upload File | ${Locator} | ${FileName}
    Click Web Element    ${Locator}
    ${PathUploadFile}    Set Variable    ${Path}${FileName}
    Wait Until Keyword Succeeds    5x    1s    Control Set Text    strTitle=File Upload    strText=    strControl=Edit1
    ...    strControlText=${PathUploadFile}
    Sleep    1s
    Control Click    strTitle=File Upload    strText=    strControl=Button1    strButton=LEFT    nNumClicks=1
    Sleep    1s
    ${State}    Win Get State    strTitle=File Upload    strText=
    log    ${State}
    BuiltIn.Run Keyword If    ${State} != 0    BuiltIn.Fail    File cannot be upload.

Verify Directory Should Exist
    [Arguments]    ${Path}
    [Documentation]    Name:
    ...    Directory Should Exist
    ...    Arguments:
    ...    [ path | msg=None ]
    ...    Fails unless the given path points to an existing directory.
    ...    The path can be given as an exact path or as a glob pattern. The pattern matching syntax is explained in `introduction`. The default error message can be overridden with the msg argument.
    BuiltIn.Wait Until Keyword Succeeds    5x    1s    OperatingSystem.Directory Should Exist    ${Path}

Verify File Name In Directory
    [Arguments]    ${FileName}    ${Path}=${PathDownloadFile}
    [Documentation]    Verify FileName in Directory keyword if get file name from directory compare filename expect
    ...
    ...
    ...    *Format keyword*
    ...
    ...    Verify FileName In Directory | ${FileName} | ${Path}=${PathDownloadFile}
    BuiltIn.Wait Until Keyword Succeeds    5x    1s    OperatingSystem.File Should Exist    ${Path}${FileName}
    @{ListFile}    OperatingSystem.List Files In Directory    ${Path}    ${FileName}
    BuiltIn.Should Be Equal    @{ListFile}[0]    ${FileName}
    [Teardown]    # Delete File In Directory    ${FileName}

Web Verify Text
    [Arguments]    ${Locator}    ${Text}
    [Documentation]    Keyword will Get Text if text not found will keyword try get value com pare expect
    ...    Because Element have some one text or value
    ...
    ...
    ...    *Format keyword*
    ...
    ...    Verify Text | ${Locator} | ${Text}
    Web Element Should Be Visible    ${Locator}
    ${TextActual}    Wait Until Keyword Succeeds    5    1    Selenium2Library.Get Text    ${Locator}
    ${Temp}    Remove String    ${TextActual}    ${SPACE}
    ${Temp}    Get Length    ${Temp}    #count length because if not support special charector
    ${TextActual}    Run Keyword If    '${Temp}' == '0'    Selenium2Library.Get Value    ${Locator}
    ...    ELSE    Set Variable    ${TextActual}
    Should Be Equal    ${TextActual}    ${Text}
    [Teardown]    Selenium2Library.Capture Page Screenshot

Web Checkbox Should Be Selected
    [Arguments]    ${Locator}
    Selenium2Library.Checkbox Should Be Selected    ${Locator}

Web Checkbox Should Not Be Selected
    [Arguments]    ${Locator}
    Selenium2Library.Checkbox Should Not Be Selected    ${Locator}

Web Element Get Matching Xpath Count
    [Arguments]    ${Locator}    ${Timeout}=${maxTimeOut}
    [Documentation]    Returns number of elements matching by xpath
    ...
    ...
    ...    *Format keyword*
    ...
    ...    Web Element Get Matching Xpath Count | ${Locator} | ${Timeout}=${maxTimeOut}
    Web Element Should Be Visible    ${Locator}    ${Timeout}
    ${Count}    Selenium2Library.Get Matching Xpath Count    ${Locator}
    [Return]    ${Count}

Web Element Mouse Over
    [Arguments]    ${Locator}    ${Index}=None    ${Timeout}=${maxTimeOut}
    [Documentation]    Simulates hovering mouse over to the element
    ...
    ...
    ...    *Format keyword*
    ...
    ...    Web Element Mouse Over | ${Locator} | ${Timeout}=${maxTimeOut}
    ${Locator}    Run Keyword If    '${Index}' != 'None'    Get Full Xpath    ${Locator}    ${Index}
    ...    ELSE    Set Variable    ${Locator}
    ${Result}    BuiltIn.Run Keyword And Return Status    Selenium2Library.Wait Until Page Contains Element    ${Locator}    ${Timeout}
    BuiltIn.Run Keyword If    '${result}'=='False'    Selenium2Library.Wait Until Element Is Visible    ${Locator}    ${Timeout}
    Selenium2Library.Scroll Element Into View    ${Locator}
    Selenium2Library.Mouse Over    ${Locator}

Web Element Should Be Disabled
    [Arguments]    ${Locator}    ${Timeout}=${maxTimeOut}
    [Documentation]    Verify that element is disabled.
    ...
    ...
    ...    *Format keyword*
    ...
    ...    Web Element Should Be Disabled | ${Locator} | ${Timeout}=${maxTimeOut}
    Selenium2Library.Wait Until Element Is Visible    ${Locator}    ${Timeout}
    Selenium2Library.Element Should Be Disabled    ${Locator}

Web Element Should Be Enabled
    [Arguments]    ${Locator}    ${Timeout}=${maxTimeOut}
    [Documentation]    Verify that element is enabled.
    ...
    ...
    ...    *Format keyword*
    ...
    ...    Web Element Should Be Enabled | ${Locator} | ${Timeout}=${maxTimeOut}
    Selenium2Library.Wait Until Element Is Visible    ${Locator}    ${Timeout}
    Selenium2Library.Element Should Be Enabled    ${Locator}

Web Element Should Be Not Visible
    [Arguments]    ${Locator}    ${Timeout}=${maxTimeOut}
    [Documentation]    Verify that element is not visible.
    ...
    ...
    ...    *Format keyword*
    ...
    ...    Web Element Should Be Not Visible | ${Locator} | ${Timeout}=${maxTimeOut}
    ${result}    Run Keyword And Return Status    Selenium2Library.Element Should Not Be Visible    ${Locator}
    Run Keyword If    ${result} == ${False}    Selenium2Library.Wait Until Element Is Not Visible    ${Locator}    ${Timeout}

Web Element Should Be Visible
    [Arguments]    ${Locator}    ${Timeout}=${maxTimeOut}
    [Documentation]    Verify that the element is visible.
    ...
    ...
    ...    *Format keyword*
    ...
    ...    Web Element Should Be Visible | ${Locator} | ${Timeout}=${maxTimeOut}
    ${result}    Run Keyword And Return Status    Selenium2Library.Wait Until Page Contains Element    ${Locator}    ${Timeout}
    ${result}    Run Keyword And Return Status    Selenium2Library.Wait Until Element Is Visible    ${Locator}    ${Timeout}
    Selenium2Library.Element Should Be Visible    ${Locator}

Web Get Elements
    [Arguments]    ${Locator}    ${Timeout}=${maxTimeOut}
    [Documentation]    Return list of web element objects.
    ...
    ...
    ...    *Format keyword*
    ...
    ...    Web Get Elements | ${Locator} | ${Timeout}=${maxTimeOut}
    ${result}    BuiltIn.Run Keyword And Return Status    Selenium2Library.Wait Until Element Is Visible    ${Locator}    ${Timeout}
    BuiltIn.Run Keyword If    '${result}'=='False'    Selenium2Library.Wait Until Page Contains Element    ${Locator}    ${Timeout}
    ${elements}    Selenium2Library.Get Webelements    ${Locator}
    [Return]    ${elements}

Web Select Checkbox
    [Arguments]    ${Locator}
    [Documentation]    Selects checkbox identified by locator
    ...
    ...
    ...    *Format keyword*
    ...
    ...    Web Select Checkbox | ${Locator} | ${Timeout}=${maxTimeOut}
    : FOR    ${INDEX}    IN RANGE    1    5
    \    BuiltIn.Run Keyword And Return Status    Selenium2Library.select Checkbox    ${Locator}
    \    BuiltIn.Sleep    0.5
    \    ${checkboxStatus}    BuiltIn.Run Keyword And Return Status    Selenium2Library.Checkbox Should Be Selected    ${Locator}
    \    BuiltIn.Exit For Loop If    ${True} == ${checkboxStatus}

Web Unselect CheckBox
    [Arguments]    ${Locator}
    [Documentation]    Removes selection of checkbox identified by locator
    ...
    ...
    ...    *Format keyword*
    ...
    ...    Web Unselect Checkbox | ${Locator} | ${Timeout}=${maxTimeOut}
    : FOR    ${INDEX}    IN RANGE    1    5
    \    BuiltIn.Run Keyword And Return Status    Selenium2Library.Unselect Checkbox    ${Locator}
    \    BuiltIn.Sleep    0.5
    \    ${checkboxStatus}    BuiltIn.Run Keyword And Return Status    Selenium2Library.Checkbox Should Not Be Selected    ${Locator}
    \    BuiltIn.Exit For Loop If    ${True} == ${checkboxStatus}
