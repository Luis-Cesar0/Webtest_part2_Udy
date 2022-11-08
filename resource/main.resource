*** Settings ***
Library             SeleniumLibrary

Resource            ../resource/pages/carinho.resource
Resource            ../resource/pages/carinho_BDD.resource

*** Keywords ***
Abri navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar navegador
    Capture Page Screenshot
    Close Browser