*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# Add new currency      Test 2
${CURRENCY}                 xpath=//*[@id="app"]/div/div[1]/div/div/div/div[2]/div/div/main/div[6]/div/div[1]/div[2]/button
${ADD_NEW}                  New
${HKD}                      xpath=//div/div/div/div[6]/button[8]/span
${CREATE_ACCOUNT}           Create account

# Exchange              Test 3
${EXCHANGE}                 xpath=//*[@id="app"]/div/div[1]/div/div/div/div[2]/div/div/main/div[6]/div/div[1]/div[4]/div/button[3]
${ADD_AMOUNT1}              xpath=//*[@id="app"]/div/div[1]/div/div/div/div[2]/div/div/div/main/div[4]/div/div[1]/div[3]/input
${VALUE_AMOUNT}             30
${CONTINUE}                 xpath=//button[@class='ButtonBase-sc-188b3i5-0 bCoPaV Button-sc-1gvtpv4-0 fKYZMC']

# Payments              Test 4
${PAYMENTS}                 xpath=//*[@id="app"]/div/div[1]/div/div/div/div[2]/div/div/nav/nav/div[1]/div[2]/a/span
${SEND}                     xpath=//*[@id="app"]/div/div[1]/div/div/div/div[2]/div/div/main/div[5]/div[1]/div[1]/span[1]/div/button[1]
${PAY_BILL}                 xpath=/html/body/div[5]/div/div/div/main/div[5]/div[1]/div[2]/div/button[1]
${ADD_AMOUNT}               xpath=//div/div[3]/input
${VALUE}                    1000
${REFERENCE}                xpath=//div/div/div/div[2]/input
${REFERENCE_WORD}           Random word
${CONFIRM_BUTTON}           Continue
${TRUST_CONFIRM_BUTTON}     Yes, continue    #xpath=//button[@class='ButtonBase-sc-188b3i5-0 bCoPaV Button-sc-1gvtpv4-0 bDMwyQ']
${SEND_FUNDS}               Send funds


# Add card              Test 5
${CARDS}                    xpath=//*[@id="app"]/div/div[1]/div/div/div/div[2]/div/div/main/div[4]/div/a[2]
${ADD_CARD}                 xpath=//*[@id="app"]/div/div[1]/div/div/div/div[2]/div/div/main/div[6]/div[1]/div[2]/button
${TEAM_MEMBER}              xpath=//*[@id="app"]/div/div[1]/div/div/div/div[2]/div/div/div/main/div[4]/div[2]/div[2]/button
${V_DEB_CARD}               xpath=//*[@id="app"]/div/div[1]/div/div/div/div[2]/div/div/div/main/button  #xpath=//button[@class='Box-sc-1g1k12l-0 bGnMcF']

*** Keywords ***
Add card
    [Documentation]         Add card
    click element           ${CARDS}
    click element           ${ADD_CARD}
    click element           ${TEAM_MEMBER}
    click element           ${V_DEB_CARD}

Payment
    [Documentation]         Do a payment
    click element           ${PAYMENTS}
    click element           ${SEND}
    click element           ${PAY_BILL}
    input text              ${ADD_AMOUNT}               ${VALUE}
    input text              ${REFERENCE}                ${REFERENCE_WORD}
    click button            ${CONFIRM_BUTTON}
    click button            ${TRUST_CONFIRM_BUTTON}

# To continue, confirmation password send to default number is required
    #click button           ${SEND_FUNDS}

Add business account
    [Documentation]         Add business account HKD
    click element           ${CURRENCY}
    click button            ${ADD_NEW}
    click element           ${HKD}
    click button            ${CREATE_ACCOUNT}

Exchange
    [Documentation]         Exchange currency
    click element           ${EXCHANGE}
    input text              ${ADD_AMOUNT1}             ${VALUE_AMOUNT}
    click button            ${CONTINUE}
    click button            ${CONTINUE}