*Settings*
Documentation    suite de teste para verificar se o app esta online

Resource    ${EXECDIR}/resources/base.robot

Test Setup       Start session
Test Teardown    End session


*Test Cases*
yodapp deve estar online
    Get Title    equal    Yodapp | QAninja

deve exibir mensagem de boas vindas
    Wait For Elements State    css=#welcome >> text= Que a Força (qualidade) esteja com você!    visible    5

