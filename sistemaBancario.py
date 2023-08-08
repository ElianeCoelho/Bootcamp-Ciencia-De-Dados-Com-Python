#criar um sistema bancário com as operações: sacar, depositar, e vizualizar extrato
menu = """
[d] Depositar
[s] Sacar
[e] Extrato
[q] Sair
=> """
saldo = 0
limite = 500
extrato = ""
numero_saques = 0
LIMITE_SAQUES = 3

while True:

    opcao = input(menu)

    if opcao == "d":
        valor = float(input("informe o valor do depósito: "))

        if valor > 0:
            saldo += valor
            extrato += f"Depósito: R$ {valor:.2f}\n"
            print("depósito realizado com sucesso!")

        else:
            print("Operação falhou! o valor informado é inválido.")

    elif opcao == "s":
        valor = float(input("informe o valor do saque: "))
        
        excedeu_saldo = valor > saldo

        excedeu_limite = valor > limite

        excedeu_saque = numero_saques >= LIMITE_SAQUES

        if excedeu_saldo:
            print("Saldo insuficiente")
        elif excedeu_limite:
            print("valor excede o limite disponível")
        elif excedeu_saque:
            print("Número de saques excedidos, volte amanhã")

        elif valor > 0:
            saldo -= valor
            extrato += f"Saque: R$ {valor:.2f}\n"
            numero_saques += 1

        else:
            print('Operação falhou! valor informado é inválido.')

    elif opcao == "e":
        print("\n************Extrato*******************")
        print("não foram realizadas movimentações." if not extrato else extrato)
        print(f"\nSaldo: R${saldo:.2f}")
        print("*****************************************")
    
    elif opcao == "q":
        break

    else:
        print("Opção inválida, por favor selecionar novamente operação desejada.")

