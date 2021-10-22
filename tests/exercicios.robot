*** Settings ***
Documentation        Neste arquivo estaram presentes todos os exercicios de automação da Prime

*** variable ***
# Minha primeira variável do tipo dicionário
&{PESSOA}        
...    nome=Andreia    
...    sobrenome=artuso    
...    idade=    
...    cpf=12345678988    
...    profissao=analista negocios
...    carro=palio

@{FRUTAS}    Banana    Abacaxi    Limao    Jabuticaba

*** test Case ***
Cenario: Imprimindo 6 informações de uma PESSOA
    Log To Console    ${PESSOA.nome}  
    Log To Console    ${PESSOA.sobrenome} 
    Log To Console    ${PESSOA.idade} 
    Log To Console    ${PESSOA.cpf} 
    Log To Console    ${PESSOA.profissao} 
    Log To Console    ${PESSOA.carro} 

Cenario: Imprimindo lista de frutas
    [Tags]                   LISTA
    
    LOG To Console           ${FRUTAS}
    LOG To Console           ${FRUTAS[0]}
    LOG To Console           ${FRUTAS[3]}

Cenario: Somando dois numeros
    [Tags]                SOMAR 
    Somar dois numeros    10    10

Cenario: Criando E-mail
    [Tags]        EMAIL
    Criando E-mail    Ana    Santos    42
    ${RESULTADO_EMAIL}    Criando E-mail    "Ana"    "Santos"    "42" 
    Log To Console    ${RESULTADO_EMAIL} 

Cenario: Contando de 0 a 9
    [Tags]        CONTAR
    FOR    ${COUNT}    IN RANGE    0   9
        Log To Console    ${COUNT}
    END  

Cenario: Percorrendo lista de frutas
    [Tags]            FRUTAS 
    Percorrer itens de uma lista 

Cenario:Imprimir frase Estou no numero 
    [Tags]        NUMERO  
    Imprimir frase estou no numero          



*** Keywords ***
 Somar dois numeros
     [Arguments]    ${NUM_A}     ${NUM_B}
     ${SOMA}        Evaluate     ${NUM_A}+${NUM_B}
     [Return]       ${SOMA}   

Criando E-mail
[Arguments]    ${NOME}    ${SOBRENOME}    ${IDADE}
${RESULTADO_EMAIL}    Catenate    ${NOME}_${SOBRENOME}_${IDADE}@robot.com
Log To Console    ${RESULTADO_EMAIL}

Percorrer itens de uma lista
    @{FRUTAS}    Create list    Banana    Abacaxi    Limao
    FOR    ${FRUTAS}    IN    @{FRUTAS}
        Log To Console        ${FRUTAS}
    END 

Imprimir frase Estou no numero 
FOR ${NUMERO}    IN RANGE    0    10
    Log    ${NUMERO}
END

Numero 5 ou 8
IF    ${NUMERO}==5 ou 8
    Log    Vou fazer isso quando for 5 ou 8
ELSE IF    ${NUMERO}    
ELSE
    
END

