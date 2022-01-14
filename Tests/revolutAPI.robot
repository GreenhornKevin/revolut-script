*** Settings ***
Library    RequestsLibrary
Library    SeleniumLibrary

*** Variables ***
${URL}      https://sandbox-business.revolut.com/signin

*** Test Cases ***
Web status OK (200)
    Create Session    web               ${URL}              disable_warnings=true
    Log                 web
    ${headers}=         Create Dictionary    User-Agent=RFTest
    ${resp}=            Get On Session       web                  /                        headers=${headers}
    Status Should Be    200                  ${resp}

Check web status NOK (404)