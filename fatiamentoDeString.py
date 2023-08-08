#fatiamento de strig retorna parte da string Original, ou seja, uma técnica para usar substrings
#parte da String original , informando inicio(start), fim(stop) e passo (step): [start:stop[,step]].

nome = "eliane da silva coelho"

print(nome[0])

print(nome[:9])

print(nome[9:])

print(nome[0:6])

#step pode ser qualquer numero inteiro e negativo, nesse caso ele irá pular a cada duas casas
print(nome[0:6:2])

#cópia da string
print(nome[:])
#cópia da String Invertida
print(nome[::-1])