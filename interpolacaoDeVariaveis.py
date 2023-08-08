nome = "guilherMe"
idade = 34
profissao = "dev"
linguagem = "jaVa"

dados={"nome":"eliane", "idade": 33, "signo:": "escorpion"}
dadosFilhos={"nome":"rafael", "idade": 3}

#forma não muito utilizada, mas, existe
print('Me chamo: %s tenho: %s anos' % (nome, idade))

#não muito usada, usando CLASSE format
print("Minha prifssão é: {} linguagem {}".format(profissao , linguagem))
print("Minha prifssão é: {0} linguagem {1}".format(profissao, linguagem))

#caso mais comum de se usar
print("Me chamo {nome} tenho {idade} anos, sou {profissao} programo em linguagem {linguagem}".format(nome=nome, idade=idade, profissao=profissao, linguagem=linguagem))

print("Meus filhos: {nome} idade: {idade}".format(**dadosFilhos))

print(nome.upper())