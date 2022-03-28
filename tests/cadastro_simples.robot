*Settings*
Documentation    Suite de testes do cadastro de personagens

Resource    ${EXECDIR}/resources/base.robot

Test Setup       Start session
Test Teardown    End session

*Test Cases*
deve cadastrar um novo personagen
    [Tags]    happy

    Go to user form
    Fill user form                Mestre Yoda       yoda@jedi.com    Jedi    fevereiro-1970-20    @yoda
    Select jedi                   Cavaleiro Jedi
    Check accept comunications
    Submit user form

    Toast message should be    Usuário cadastrado com sucesso!

email incorreto
    [Tags]    inv_mail

    Go to user form
    Fill user form      Darth Veder    veder&sith.com    Sith    dezembro-1980-15    @veder
    Submit user form

    Toast message should be    Oops! O email é incorreto. 