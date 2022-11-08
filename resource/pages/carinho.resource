*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${Armazon}                         https://www.amazon.com.br/
${carrinho-vz}                     xpath=//span[contains(text(), "foi removido de Carrinho de compras.")]

*** Keywords ***

Acessar a home page do site Amazon.com.br
    Go To                          ${Armazon}
    Wait Until Element Is Visible  css=a[id="nav-logo-sprites"]

Digitar o nome de produto "${produto}" no campo de pesquisa
    Input Text                     css=input[id="twotabsearchtextbox"]    ${produto}

Clicar no botão de pesquisa
    Click Element                  css=input[id="nav-search-submit-button"]

Verificar o resultado da pesquisa se está listando o produto "${produto}"
    Wait Until Page Contains       ${produto}

Adicionar o produto "${produto}" no carrinho
    Click Element                  xpath=//img[contains(@alt,'${produto}')]
    Element Should Be Visible      xpath=//input[contains(@name,'submit.add-to-cart')]
    Click Element                  xpath=//input[contains(@name,'submit.add-to-cart')]

Verificar se o produto "${produto}" foi adicionado com sucesso
    Click Element                  css=div[id="nav-cart-text-container"]
    Element Should Be Visible      xpath=//span[@class='a-truncate-cut'][contains(.,'${produto}')]

Remover o produto "Console Xbox Series S" do carrinho
    Click Element                  css=input[value="Excluir"]

Verificar se o carrinho fica vazio
    Element Text Should Be         ${carrinho-vz}    Console Xbox Series S foi removido de Carrinho de compras.