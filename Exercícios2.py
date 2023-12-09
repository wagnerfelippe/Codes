#DataScience para Python

#Caso de Uso Crescimento da População Brasileira 1980-2016

#Fazendo o import do pylot
import matplotlib.pyplot as plt

#Lendo o arquivo 
dados = open("populacao_brasileira.csv").readlines()

#adicionando variáveis para o título e eixo
title = "Crescimento da População Brasileira 1980-2016"
eixox = "Ano"
eixoy = "População x100.000.000"

#criando os eixos que receberão os valores dos arquivos
x = []
y = []

#Agora vamos criar o for. Faço a leitura do tamanho do arquivo e ignorando a primeira linha que é 0, a
# minha variável linha recebe a variável o índice da variável de dados, com o split ; e vamos
# converter a string em inteiro e vamos adicionar a com append no indice 0 e 1 e depois imprimir.
for i in range(len(dados)):
    if i != 0:
        linha = dados[i].split(";")
        x.append(int(linha[0]))
        y.append(int(linha[1]))
print(y)


#A partir daqui começo a construir o meu gráfico.
plt.bar(x,y, color='#e4e4e4')
plt.plot(x,y, color='k', linestyle='--')
plt.title(title)
plt.xlabel(eixox)
plt.ylabel(eixoy)
plt.show()



#=======================================================================================================================================
#=======================================================================================================================================
#====================================================  CRIANDO UM GRÁFICO DE DISPERSÃO - SCATTERPLOT V2  =============================






#importando a biblioteca para visualização de gráficos
#import matplotlib.pyplot as plt

#x = [1,3,5,7,9]
#y = [2,3,7,1,0]
#z = [20,5,100,33,10]

#criando as variáveis para legendas
#titulo = "Scatterplot: gráfico de dispersão"
#eixox = "Eixo X"
#eixoy = "Eixo Y"

#Criando meu título
#plt.title(titulo)

#Criando as legendas do eixo
#plt.xlabel(eixox)
#plt.ylabel(eixoy)

#Gráfico de dispersão + um gráfico de linha ligando os pontos, mudando a cor dos pontos para vermelho, usando um marcador bolinha e aumentando ele para 200.
#Além disso, mudamos a linha de sólida para traço e traço.
#Outro ponto é que mudamos o tamanho da bola de acordo com os valores da lista z. Podemos mudar para o tamanho da lista y ou x, dependendo do que o mesmo deseja.
#plt.scatter(x,y, label = 'Meus pontos', color = 'r', marker='.', s=z)
#plt.plot(x,y, color='#009900', linestyle='--')
#plt.legend()

#mostrando no gráfico como fico os valores no gráfico de linhas
#plt.show()

#Salvando o arquivo em png. Ou em qualquer formato que queira. Só colocar a extensão dela.
#Também conseguimos formar a imagem pelo dpi dela. Assim configuramos a qualidade e o tamanho dela.
#plt.savefig("figura1.png", dpi=300)





#=======================================================================================================================================
#=======================================================================================================================================
#====================================================  CRIANDO UM GRÁFICO DE DISPERSÃO - SCATTERPLOT  ==================================

#https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.plot.html - Documentação 

##importando a biblioteca para visualização de gráficos
#import matplotlib.pyplot as plt
#
#x = [1,3,5,7,9]
#y = [2,3,7,1,0]
#z = [20,5,100,33,10]
#
##criando as variáveis para legendas
#titulo = "Scatterplot: gráfico de dispersão"
#eixox = "Eixo X"
#eixoy = "Eixo Y"
#
##Criando meu título
#plt.title(titulo)
#
##Criando as legendas do eixo
#plt.xlabel(eixox)
#plt.ylabel(eixoy)
#
##Gráfico de dispersão + um gráfico de linha ligando os pontos, mudando a cor dos pontos para vermelho, usando um marcador bolinha e aumentando ele para 200.
##Além disso, mudamos a linha de sólida para traço e traço.
##Outro ponto é que mudamos o tamanho da bola de acordo com os valores da lista z. Podemos mudar para o tamanho da lista y ou x, dependendo do que o mesmo deseja.
#plt.scatter(x,y, label = 'Meus pontos', color = 'r', marker='.', s=z)
#plt.plot(x,y, color='#009900', linestyle='--')
#plt.legend()
#
##mostrando no gráfico como fico os valores no gráfico de linhas
#plt.show()
#
#
#
#
#color: cor (ver exemplos abaixo)
#
#label: rótulo
#
#linestyle: estilo de linha (ver exemplos abaixo)
#
#linewidth: largura da linha
#
#marker: marcador (ver exemplos abaixo)
#
#
#
#CORES (color)
#'b' blue
#
#'g' green
#
#'r' red
#
#'c' cyan
#
#'m' magenta
#
#'y' yellow
#
#'k' black
#
#'w' white
#
#
#
#Marcadores (marker)
#'.' point marker
#
#',' pixel marker
#
#'o' circle marker
#
#'v' triangle_down marker
#
#'^' triangle_up marker
#
#'<' triangle_left marker
#
#'>' triangle_right marker
#
#'1' tri_down marker
#
#'2' tri_up marker
#
#'3' tri_left marker
#
#'4' tri_right marker
#
#'s' square marker
#
#'p' pentagon marker
#
#'*' star marker
#
#'h' hexagon1 marker
#
#'H' hexagon2 marker
#
#'+' plus marker
#
#'x' x marker
#
#'D' diamond marker
#
#'d' thin_diamond marker
#
#'|' vline marker
#
#'_' hline marker
#
#
#
#
#
#Tipos de linha (linestyle)
#'-' solid line style
#
#'--' dashed line style
#
#'-.' dash-dot line style
#
#':' dotted line style
#
#
#
#Fonte: https://matplotlib.org/api/_as_gen/matplotlib.pyplot.plot.html








#=======================================================================================================================================
#=======================================================================================================================================
#===================================================== CRIANDO UM GRÁFICO DE BARRAS COM 2 GRUPOS ========================================

#import matplotlib.pyplot as plt
#
#x1 = [1,3,5,7,9]
#y1 = [2,3,7,1,0]
#
#x2 = [2,4,6,8,10]
#y2 = [5,1,3,7,4]
#
##criando as variáveis para legendas
#titulo = "Gráfico de Barras 2"
#eixox = "Eixo X"
#eixoy = "Eixo Y"
#
##Criando meu título
#plt.title(titulo)
#
##Criando as legendas do eixo
#plt.xlabel(eixox)
#plt.ylabel(eixoy)
#
#
##Chamando o grafico de barras e passando as 2 variáveis de valores
#plt.bar(x1, y1, label = "Grupo 1")
#plt.bar(x2, y2, label = "Grupo 2")
#plt.legend()
#
##mostrando no gráfico como fico os valores no gráfico de linhas
#plt.show()









#=======================================================================================================================================
#=======================================================================================================================================
#===================================================== CRIANDO UM GRÁFICO DE BARRAS ====================================================


#importando a biblioteca para visualização de gráficos
##import matplotlib.pyplot as plt
#
#x = [1,2,3,4,5]
#y = [2,3,7,1,0]
#
##criando as variáveis para legendas
#titulo = "Gráfico de Barras"
#eixox = "Eixo X"
#eixoy = "Eixo Y"
#
##Criando meu título
#plt.title(titulo)
#
##Criando as legendas do eixo
#plt.xlabel(eixox)
#plt.ylabel(eixoy)
#
#
##Chamando o grafico de barras e passando as 2 variáveis de valores
#plt.bar(x, y)
#
##mostrando no gráfico como fico os valores no gráfico de linhas
#plt.show()
#






#=======================================================================================================================================
#=======================================================================================================================================
#===================================================== CRIANDO UM GRÁFICO DE LINHAS ====================================================

#importando a biblioteca para visualização de gráficos
#import matplotlib.pyplot as plt

#x = [1,2,5]
#y = [2,3,7]
#
##criando as variáveis para legendas
#titulo = "Gráfico de Linhas"
#eixox = "Eixo X"
#eixoy = "Eixo Y"
#
##Criando meu título
#plt.title(titulo)
#
##Criando as legendas do eixo
#plt.xlabel(eixox)
#plt.ylabel(eixoy)
#
#
##Chamando o grafico de linhas e passando as 2 variáveis de valores
#plt.plot(x, y)
#
##mostrando no gráfico como fico os valores no gráfico de linhas
#plt.show()
