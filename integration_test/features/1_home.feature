# language: pt
Funcionalidade: Home

  Cenário: Usuário escreve nome na tela
    Dado que escrevo "Toshi Ossada"
    Quando paro de escrever
    Então Espero o texto "Olá Toshi Ossada"
