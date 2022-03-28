*Settings*
Documentation    Suite de testes do cadastro de personagens

Resource    ${EXECDIR}/resources/base.robot

Test Setup       Start session
Test Teardown    End session

*Test Cases*
deve cadastrar um novo personagen
    [Tags]    happy

    &{user}    Create Dictionary
    ...        name=Mestre Yoda 
    ...        email=yoda@jedi.com 
    ...        ordem=Jedi
    ...        tipo=Cavaleiro Jedi
    ...        date=fevereiro-1970-20 
    ...        insta=@yoda

    Go to user form
    Fill user form [dicionario]    ${user}           
    Select jedi                    ${user}[tipo] 
    Check accept comunications
    Submit user form

    Toast message should be    Usuário cadastrado com sucesso!

email incorreto
    [Tags]    inv_mail

    &{user}    Create Dictionary
    ...        name=Darth Veder
    ...        email=veder&sith.com 
    ...        ordem=Sith
    ...        date=dezembro-1980-15
    ...        insta=@veder

    Go to user form
    Fill user form [dicionario]    ${user}    
    Submit user form

    Toast message should be    Oops! O email é incorreto. 