def verificarIdade():
    idade=int(input("qual sua idade\n"))
    if(idade >=18):
        print("maior de idade")
    else:
        print("menor de idade")
#peça um numero e mostre ele mais dois números seguintes 
def exibirDoisNumerosSeguintes():
    numero = int(input("digite um valor: "))
    print(numero, numero+1, numero+2)

#peça um numero e mostre ele mais 100 números seguintes 
def exibirCemNumerosSeguintes():
    numero = int(input("digite um valor: "))
    

#verificando vogais do texto
def verificandoTexto():
    texto = input("informe o texto: ")
    vogais = "AEIOU"
    for letra in texto:
        if letra.upper() in vogais:
            print(letra, end="")


verificandoTexto()
