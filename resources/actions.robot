*Settings*

Documentation    Ações customizadas do app Yodapp
                # exemplo para selecionar elementos flutuantes Toast via log
                #   sleep   2
                #   ${html}     Get Page Source
                #   Log         ${html}


*Keywords*
Go to home page
    Go To                      ${BASE_URL} 
    Wait For Elements State    css=.carousel    visible    5

Go to user form
    Click                      css=a[href*="new"] >> text=Novo
    Wait For Elements State    css=.card-header-title >> text=Cadastrar novo usuário    visible    5

Fill user form
    [Arguments]    ${name}    ${email}    ${ordem}    ${bdate}    ${insta}

    Fill Text            css=input[name="nome"]     ${name}
    Fill Text            css=input[name="email"]    ${email}
    Select Options By    css=.ordem select          text        ${ordem}
    Select Birth Date    ${bdate}
    Fill Text            id=insta                   ${insta}

Fill user form [dicionario]
    [Arguments]    ${user}

    Fill Text            css=input[name="nome"]     ${user}[name]
    Fill Text            css=input[name="email"]    ${user}[email]
    Select Options By    css=.ordem select          text              ${user}[ordem]
    Select Birth Date    ${user}[date]
    Fill Text            id=insta                   ${user}[insta]

Select jedi
    [Arguments]    ${tpjedi}

    Click    xpath=//input[@value="${tpjedi}"]/../span[@class="check"]

Select Birth Date
    [Arguments]    ${text_date}

    @{date}    Split String    ${text_date}    -

    Click    css=input[name="Data de nascimento"]

    Select Options By    xpath=(//header[@class="datepicker-header"]//select)[1]    text     ${date}[0]    5
    Select Options By    xpath=(//header[@class="datepicker-header"]//select)[2]    value    ${date}[1]    5

    Click    xpath=//a[contains(@class, "datepicker-cell")]//span[text()="${date}[2]"]

Check accept comunications
    Click    xpath=//input[@name="comunications"]/../span[@class="check"]

Submit user form
    Click    css=button >> text=Cadastrar    

Toast message should be
    [Arguments]    ${expected_message}

    ${el}    Set variable    css=.toast div

    Wait For Elements State    ${el}    visible    5
    Get text                   ${el}    equal      ${expected_message} 

User should be visible
    [Arguments]    ${user}

    ${el}    Set variable    xpath=//td[contains(text(), "${user}[email]")]/..

    Wait For Elements State    ${el}    visible     5
    Get text                   ${el}    contains    ${user}[name]
    Get text                   ${el}    contains    ${user}[email]
    Get text                   ${el}    contains    ${user}[insta]