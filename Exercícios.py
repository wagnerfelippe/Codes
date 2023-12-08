#============================================================================================================================
#=============================================================================================================================
#====================================== TRABALHANDO COM PASS, BREAK AND CONTINUE==============================================

#Usando a função break

#numero = 20
#while True:
#    numero = numero-1
#    print(numero)
#    if (numero == 1):
#        break



#Usando a função continue
#numero = 10
#while True:
#    numero = numero -1
#    print(numero)
#    if (numero == 4):
#        continue
#    if (numero == 2):
#        break


#for x in range(0,5):
#    print(x)
#    pass










#============================================================================================================================
#=============================================================================================================================
#====================================== TRABALHANDO COM A FUNÇÃO ZIP ========================================================


#Criando 3 listas diferentes
#lista1 = [1,2,3,4,5]
#lista2 = ['Abacate','Bola','Cachorro','Dinheiro','Elefante']
#lista3 = ['R$ 2,00','R$ 5,00','Não tem preço','R$ 1,00','Não tem preço']


#dentro do laço for eu crio 3 variáveis que são indices no for e usando a função zip, eu concateno as 3 listas em 1 só seguindo os seus registros.
# ex: indice1 lista1 , indice1 lista2, indice1 lista3.... depois segue a sequencia.. indice2 lista1, indice2 lista2, indice2 lista3....
# depois é só imprimir


#for numero, nome, dinheiro in zip(lista1,lista2,lista3):
#    print(numero,nome, dinheiro)




#
#def dobro(i):
#    if i % 2 == 0:
#        return i
#
#lista = [1,2,3,4,5,6,7,8,9,10]
#lista2 = []
#
##lista2 = filter(dobro,lista)
#
#lista2 = map(dobro,lista)
#lista2 = list(lista2)
#
#print(lista2)














#============================================================================================================================
#=============================================================================================================================
#====================================== TRABALHANDO COM A FUNÇÃO REDUCE ======================================================

#importando a função 
#from functools import reduce

#criando uma função de soma
#def soma(x,y):
#    return x+y

#criando minha lista de teste para somar todas os valores dentro de uma lista
#lista = [1,3,5,10,20]

#criando a variável para receber a função reduce. Ela pega a minha função de soma + a lista que eu quero somar.
#soma = reduce(soma, lista)

#print(soma)





#============================================================================================================================
#=============================================================================================================================
#====================================== TRABALHANDO COM A FUNÇÃO MAP ============================================================

#criando função para retornar o dobro do valor do padrametro
#def dobro(x):
#    return x*2

#Criando uma lista de valores
#valor = [1,2,3,4,5]

#criando uma variável, usando a função map para receber o valor e atribuir os valores dobrados na minha variável
#a função map recebe 2 parâmetros como a função e a lista que eu quero aplicar
#valor_dobrado = map(dobro, valor)

#Aqui eu atribuo o valor que já está dobrado na propria variável através do comando list. Os valores serão como lista.
#valor_dobrado = list(valor_dobrado)

#print(valor_dobrado)

#Aqui estamos fazendo a mesma coisa, porém sem usar a função list e sim um for para imprimir os valores. Aqui não será atribuído em uma lista e sim será impresso os valores em si.
#for v in valor_dobrado:
#    print(v)




#============================================================================================================================
#=============================================================================================================================
#====================================== TRABALHANDO COM A FUNÇÃO ENUMERATE ============================================================




#criando uma lista e depois imprimindo o índice da lista + a lista
#lista = ["abacate","bola", "cachorro"]
#for i in range(len(lista)):
#    print(i, lista[i])

#imprimindo o índice da lista + a lista usando a função enumerate
#for i, nome in enumerate(lista):
#    print(i, nome)





#============================================================================================================================
#=============================================================================================================================
#====================================== TRABALHANDO COM A FUNÇÃO LIST COMPREHENSION ===================================================

#List comprehension - elevar a lista ao quadrado de outra maneira

#x = [1,2,3,4,5] #criando minha lista
#y = [i**2 for i in x] #evelando a minha lista x ao quadrado e atribuindo a lista y
#z = [i for i in x if i%2==1] #pegando os valores ímpares da minha lista x



# elevar a minha lista ao quadrado
#for i in x:
#    y.append(i**2)

#print(x)
#print(y)
#print(z)







#============================================================================================================================
#=============================================================================================================================
#====================================== EXERCÍCIO NÚMERO 1 ==================================================================

#Faça um programa que receba a idade do usuário e diga se ele é maior ou menor de idade
#idade = int(input("Digite sua idade: "))
# 
#if idade >= 18:
#    print("Maior de idade") 
#elif idade < 18:
#    print("Menor de idade/n")
#

#============================================================================================================================
#=============================================================================================================================
#====================================== EXERCÍCIO NÚMERO 2 ==================================================================

##Faça um programa que receba duas notas digitadas pelo usuário. 
##Se a nota for maior ou igual a seis, escreva aprovado, senão escreva reprovado.
#nota1 = float(input("Digite a primeira nota: "))
#nota2 = float(input("Digite a segunda nota: "))
# 
#media = (nota1+nota2)/2
# 
#if media >= 6:
#    print("Aprovado")
#else:
#    print("Reprovado")
#



#============================================================================================================================
#=============================================================================================================================
#====================================== EXERCÍCIO NÚMERO 3 ==================================================================

##Escreva um programa que resolva uma equação de segundo grau
#from math import sqrt
#a = int(input("Digite o valor de A: "))
#b = int(input("Digite o valor de B: "))
#c = int(input("Digite o valor de C: "))
# 
#delta = b**2 - 4*a*c
# 
#if delta < 0:
#    print("Delta negativo")
#else:
#    raiz_delta = sqrt(delta)
#    x1 = (-b + raiz_delta)/2*a
#    x2 = (-b - raiz_delta)/2*a
# 
#    print("As raízes são", x1, "e", x2)
#


#============================================================================================================================
#=============================================================================================================================
#====================================== EXERCÍCIO NÚMERO 4 ==================================================================

##Escreva um programa que ordene uma lista numérica com três elementos
#lista = [3,2,1]
#print(sorted(lista))
#


#============================================================================================================================
#=============================================================================================================================
#====================================== EXERCÍCIO NÚMERO 5 ==================================================================

##Escreva um programa que receba dois números e um sinal, 
## e faça a operação matemática definida pelo sinal. 
#
#n1 = int(input("Digite o primeiro número: "))
#sinal = input("Digite o sinal: ")
#n2 = int(input("Digite o segundo número: "))
# 
#if sinal == "+":
#    op = n1 + n2
# 
#elif sinal == "-":
#    op = n1 - n2
# 
#elif sinal == "/":
#    op = n1 + n2
# 
#elif sinal == "*":
#    op = n1 * n2
# 
#else:
#    print("Sinal inválido.")
# 
#print(op)
#








#============================================================================================================================
#=============================================================================================================================
#====================================== Trabalhando com TRATAMENTO DE EXCESSÕES =============================================


#Criando as variáveis para testar as impressões
#a = 2
#b = 0

#Tentando dividir um valor por zero
#try:
#    print(a/b)

#Se por acaso não tiver como fazer, colocamos uma excessão para o programa não travar
#except:
#    print("Não é permitido divisão por 0")






# ============================================================================================================================
#=============================================================================================================================
#====================================== Trabalhando com RANDOM ===============================================================

#import random

#Setando um valor fixo de um random
#random.seed(3) 

#Chamando um valor entre 0 e 10 e imprimindo logo em seguida
#numero = random.randint(0,10)
#print(numero)

#Criando uma lista de valores numéricos
# lista = [6,45,9]
#Escolhe o valor dentro de uma lista
# numero = random.choice(lista)
# print(numero)










# ============================================================================================================================
#=============================================================================================================================
#====================================== Trabalhando com dicionários =========================================================



#Criando um dicionario
#meu_dicionario = {"A": "Ameixa", "B":"Bola", "C": "Cachorro"}

#Imprimindo o valor da chave
#print(meu_dicionario)

#Imprimindo todas as minhas chaves
#for chave in meu_dicionario:
#    print(chave)

#Imprimindo todos os meu valores
#for chave in meu_dicionario:
#    print(meu_dicionario[chave])

#Imprimindo todos os meu valores + minha chave em uma concatenação
# for chave in meu_dicionario:
#     print(chave+":"+meu_dicionario[chave])

#imprimindo os valores porém ele transaforma esses valores em uma tupla.
#for i in meu_dicionario.items():
#    print(i)

#imprimindo as chaves do dicionario
#for i in meu_dicionario.keys():
#    print(i)

#imprimindo os valores do dicionario
#for i in meu_dicionario.values():
#    print(i)





# ============================================================================================================================
#=============================================================================================================================
#====================================== Trabalhando com Listas e dicionários =================================================


#Criando minhas listas fixas e mistas
#minha_lista1 = ['abacaxi' , 'melancia', 'abacate']
#minha_lista2 = [1,2,3,4,5,6]
#minha_lista3 = ['abacaxi',2,4, 'TesteLista']

#Imprimindo cada elemento da lista utilizando o for. o Item é uma variarel dentro do for que você aloca os itens da lista para serem impressos.
#for item in minha_lista1:
#    print(item)


#Adicionando um item na minha lista
#minha_lista1.append('Limão')
#print(minha_lista1)

#Procurando um valor dentro da minha lista
#if 2 in minha_lista2:
#   print("2 está na lista")

#Apagando todos os indices de número 2 para frente
#del minha_lista1[2:]

#Apagando toda a lista
#del minha_lista1[:]
#print(minha_lista1)


#Criação da lista
#lista = [125,65,51,568,84,64,23,2,1,358,654,321,789,8181]

#Criand a lista de texto
#lista = ['amora','abacaxi','abacate','morango', 'manga']

#Ordenando a lista crescente
#lista.sort()

#Ordenando a lista de outra forma com outra função
#lista = sorted(lista)

#Ordenando a lista de forma decrescente
#lista.sort(reverse=True)

#Ordenando a lista de forma decrescente
#lista.reverse()

#Também ordena as lista de string
#lista.sort()
#print(lista)








# ============================================================================================================================
#=============================================================================================================================
#====================================== Trabalhando com Arquivos ==============================================================

#arquivo = open("Arquivo.txt") #Abrindo o arquivo txt
#linhas = arquivo.read() #usando a função read para leitura do arquivo
#print(linhas)  #Imprimindo na tela o arquivo
# -*- conding: utf-8 -*-

#w = open("arquivo2.txt", "w")  

#Modo a adiciona uma nova linha de escrita assim que você executar.
#Modo w escreve no arquivo porém excluindo caso você tente escrever novamente no arquivo.

#w.write("\nEsse é o meu arquivo numero 2\n")

#w.close()







# ============================================================================================================================
#=============================================================================================================================
#====================================== Trabalhando com Funções ==============================================================

#def soma(x, y):  #defininindo a função de soma que recebe 2 números - parâmetros
#   return x+y

#def multiplicacao(x,y):   #defininindo a função de multiplicacao que recebe 2 números - parâmetros
#    return x*y

#s = soma(5,5)
#m = multiplicacao(2,2)

#print(s+m)




# ============================================================================================================================
#=============================================================================================================================
#====================================== Trabalhando com Strings ==============================================================

#a = 'Wagner'
#b = 'Felippe'
#c = a + " " + b #Contatenar variáveis com o espaço
#d = "\n" + a + " " + b + "\n" #Concatenando com Espaços
#s = "O rato roeu a roupa do rei de roma"
#s = s.replace("rainha","rei") #Substituindo um string pelo outro


#s = s.split("o") #Separando a minha string por espaço ou qualquer informação que queira separar. (Ex - , . -- r t y) case sensitive
#busca = s.find("reia") #Qual é o índice da palavra que aparece. Posição da palavra

#print(s[busca:]) #Imprimindo a minha string porém começando da palavra da busca até o final. (Ex: busca recebe rei. Então ele imprime rei de roma que é o final da string)


#tamanho = len(c) #Tamanho da String
#print(a[1]) #Imprimindo a posição da string


#print(c[2:5]) # 1º valor é o ínicio da impressão. O : para indicar até onde imprimir. E o valor final é aonde eu quero terminar.
#c = c.upper() # Aqui eu seto minha variável em maiúscula. Assim ele pode imprimir em qualquer parte do código que vai ser aparece em Maiúsculo.

#print(d.strip()) # Removendo espaços do início e fim e não no meio
#print(c.upper()) # Transaformando em Maiúsculo









# ============================================================================================================================
#=============================================================================================================================
#====================================== Trabalhando com Listas ===============================================================

#Aqui estou listando um range. 
#1ª parte é qual é o número do range vai de 0 até 9
#2ª parte é setada que vai de 10 até 19
#3ª parte é de quantos em quantos número esse passo vai, então vai 10,12,14,16....
#

#for i in range(10,20,2): 
#    print(i)

# Exercício 1 - testando o for onde dentro dele, eu percorro as minhas listas.

#lista1 = [1,2,3,4,5]
#lista2 = ["Ola","Mundo","!"]
#lista3 = [0,"Ola","Biscoito",9.99,True]

#for i in lista3:
#    print(i)