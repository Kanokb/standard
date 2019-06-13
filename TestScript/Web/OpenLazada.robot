*** Settings ***
Library    Selenium2Library

*** Variables ***
${HOMEPAGE}  https://www.lazada.co.th/
${BROWSER}   chrome
${SEARCH_TEXT}   Mobile
${SEARCH_BUTTON}   xpath=//button[contains(.,'SEARCH')]
${SEARCH_ITEM}   xpath=//div[@data-qa-locator="general-products"]/div[1]

*** Test Cases ***
Open Lazada
    OpenBrowser  ${HOMEPAGE}   ${BROWSER}
    Input text   q      ${SEARCH_TEXT}
    Click Button   ${SEARCH_BUTTON}
    Click Element   ${search_item}

    sleep   10s

[[teardown]  Close Browser