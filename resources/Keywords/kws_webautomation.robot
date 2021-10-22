*** Settings ***
Documentation        Aqui estarão presentes todas as Keywords dos testes Web.

Library              SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${URL}            http://automationpractice.com/index.php

*** Keywords ***
Abrir navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar navegador
    Capture Page Screenshot
    Close Browser

### Caso de Teste 01: Pesquisar produto existente
Acessar a página home do site Automation Practice
    Go To                ${URL}
    Title Should Be      My Store
    Wait Until Element Is Visible        xpath=//*[@id="block_top_menu"]/ul  
Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text            id=search_query_top        ${PRODUTO}
Clicar no botão pesquisar
    Click Element    nome=submit_search
Conferir se o produto ${PRODUTO} foi listado no site    
    Page Should Contain Image    xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_defaut.jpg']
    Title Should Be    Search - My Store

### Caso de Teste 02: Pesquisar produto não existente    

Acessar a página home do site Automation Practice
    Go To                ${URL}
    Title Should Be      My Store
    Wait Until Element Is Visible        xpath=//*[@id="block_top_menu"]/ul  
Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text            id=search_query_top        ${PRODUTO}
Clicar no botão pesquisar
    Click Element    nome=submit_search
Conferir mensagem "No results were found for your search "itemNãoExistente""
    Page Should Contain Image    xpath=//*[@id="left_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_defaut.jpg']
    Title Should Be    Search - My Store

### Caso de Teste 03: Listar produtos
Acessar a página home do site
    Go To                ${URL}
    Title Should Be      My Store
    Wait Until Element Is Visible        xpath=//*[@id="block_top_menu"]/ul  
Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Click Element    nome=orderby
Clicar na sub categoria "Summer Dresses"
    Click Element    cat-nome=summerdresses&nbsp
Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página
    Page Should Contain Image    xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_defaut.jpg']
    Title Should Be    Search - My Store

### Caso de Teste 04: Adicionar Cliente
Acessar a página home do site
    Go To                ${URL}
    Title Should Be      My Store
    Wait Until Element Is Visible        xpath=//*[@id="block_top_menu"]/ul  
Clicar em "Sign in"
    Click Element    nome=contact-link
Informar um e-mail válido
    Input Text        id=email_create
Clicar em "Create an account"
    Click Element    nome=email_create
Preencher os dados obrigatórios
    Input Text        nome=id_gender2
    Input Text        nome=customer_firstname
    Input Text        nome=customer_lastname
    Input Text        name=email
    Input Text        id=passwd
    Input Text        id=days
    Input Text        nome=firstname
    Input Text        name=lastname
    Input Text        id=company
    Input Text        id=address1
    Input Text        id=address2
    Input Text        id=city
    Input Text        id=state
    Input Text        nome=postcode
    Input Text        nome=covntry
    Input Text        id=phone
   
Submeter cadastro
    Click Element    id=authentication
Conferir se o cadastro foi efetuado com sucesso
    Page Should Contain Image    xpath=//*[@id="my-account"]//*[@src='http://automationpractice.com/img/p/7/7-home_defaut.jpg']
    Title Should Be    Search - My Store
