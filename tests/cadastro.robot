*Settings*
Documentation    Suite de testes do cadastro de personagens

Library    ${EXECDIR}/resources/factories/users.py

Resource    ${EXECDIR}/resources/base.robot

Test Setup       Start session
Test Teardown    End session

*Test Cases*
deve cadastrar um novo personagen
    [Tags]    sucess

    ${user}    Factury Yoda

    Go to user form
    Fill user form [dicionario]    ${user}                            
    Select jedi                    ${user}[tipo] 
    Check accept comunications
    Submit user form
    Toast message should be        Usuário cadastrado com sucesso!
    Take Screenshot
    Go to home page
    User should be visible         ${user}                            

email incorreto
    [Tags]    fac

    ${user}    Factury Darth Veder

    Go to user form
    Fill user form [dicionario]    ${user}    
    Submit user form

    Toast message should be    Oops! O email é incorreto. 