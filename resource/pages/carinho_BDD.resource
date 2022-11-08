*** Settings ***
Resource    ../pages/carinho.resource

*** Keywords ***
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando adicionar o produto "Console ${produto}" no carrinho
    Digitar o nome de produto "${produto}" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "${produto}"
    Adicionar o produto "${produto}" no carrinho
Então o produto "${produto}" deve ser mostrado no carrinho
    Verificar se o produto "${produto}" foi adicionado com sucesso

E existe o produto "Console ${produto}" no carrinho
    Quando adicionar o produto "Console ${produto}" no carrinho
    Então o produto "${produto}" deve ser mostrado no carrinho

Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio