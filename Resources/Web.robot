*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Variables to Sign in
${HOMEPAGE}               https://sandbox-business.revolut.com/signin
${BROWSER}                chrome
${ACCOUNT}                kevin.franzki@tesena.com
${PASSWORD}               <Smarttesting2021>
${ACCOUNT_INPUT}          xpath=//*[@id="app"]/div/div[1]/div/div/div/main/span/div[1]/span/span/form/div[1]/label/div/div/div/div[2]/input
${CONTINUE_WITH_EMAIL}    Continue with email           #xpath=//*[@id="app"]/div/div[1]/div/div/div/main/span/div[1]/span/span/form/button
${PASSWORD_INPUT}         xpath=//*[@id="app"]/div/div[1]/div/div/div/main/span/div[1]/span/form/div[1]/label/div/div/div/div[2]/input
${LOG_IN}                 Log in
${APPROVE}                Approve

*** Keywords ***
Begin Web Test
    open browser                        ${HOMEPAGE}    ${BROWSER}
    maximize browser window
    set browser implicit wait           1s         # po načtení elementu požadovaná stránka počká 1 sekundu

End Web Test
    close all browsers

Sign in
    [Documentation]         Sign in steps
    input text              ${ACCOUNT_INPUT}                ${ACCOUNT}
    click button            ${CONTINUE_WITH_EMAIL}
    input text              ${PASSWORD_INPUT}               ${PASSWORD}
    click button            ${LOG_IN}
    click button            ${APPROVE}
