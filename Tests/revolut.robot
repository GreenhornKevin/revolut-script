*** Settings ***
Documentation       UI tests Business for Revolut
Library             SeleniumLibrary
Resource            ../Resources/Web.robot
Resource            ../Resources/Login.robot

# https://github.com/robotframework/HowToWriteGoodTestCases/blob/master/HowToWriteGoodTestCases.rst#introduction
Test Setup          Begin Web Test          #runs before each test
Test Teardown       End Web Test            #runs after each test

# https://github.com/GreenhornKevin/Revolut_RobotFramework.git = odkaz na tento projekt
# robot -d results tests/revolut.robot

*** Test Cases ***
Sign in by e-mail
# robot -d results -i  *1 "revolut.robot"
    [Documentation]     UI tests - sign in email
    [Tags]              Test 1
    Sign in
    Log                 Test 1 is completed

Add business account-HKD
# robot -d results -t "Add business account-HKD" "revolut.robot"
# robot -d results -i  *2 "revolut.robot"
    [Documentation]     UI tests - add business account
    [Tags]              Test 2
    Sign in
    sleep               3s
    Add business account
    Log                 Test 2 is completed

Exchange
# robot -d results -t "Exchange" "revolut.robot"
# robot -d results -i  *3 "revolut.robot"
    [Documentation]     UI tests - Exchange
    [Tags]              Test 3
    Sign in
    sleep               3s
    Exchange
    Log                 Test 3 is completed

Payments
# robot -d results -t "Payments" "revolut.robot"
# robot -d results -i  *4 "revolut.robot"
# "Pay*"
    [Documentation]     UI tests - payments
    [Tags]              Test 4
    Sign in
    sleep               3s
    Payment
    Log                 Test 4 is completed

Add card
# robot -d results -t "Add card" "revolut.robot"
# robot -d results -i  *5 "revolut.robot"
    [Documentation]     UI tests - add card
    [Tags]              Test 5
    Sign in
    sleep               3s
    Add card
    Log                 Test 5 is completed




