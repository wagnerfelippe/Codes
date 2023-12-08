#DataScience para Python


#=======================================================================================================================================
#=======================================================================================================================================
#====================================================  CRIANDO UM GRÁFICO DE DISPERSÃO - SCATTERPLOT  ==================================

#https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.plot.html - Documentação 

#importando a biblioteca para visualização de gráficos
import matplotlib.pyplot as plt

x = [1,3,5,7,9]
y = [2,3,7,1,0]
z = [20,5,100,33,10]

#criando as variáveis para legendas
titulo = "Scatterplot: gráfico de dispersão"
eixox = "Eixo X"
eixoy = "Eixo Y"

#Criando meu título
plt.title(titulo)

#Criando as legendas do eixo
plt.xlabel(eixox)
plt.ylabel(eixoy)

#Gráfico de dispersão + um gráfico de linha ligando os pontos, mudando a cor dos pontos para vermelho, usando um marcador bolinha e aumentando ele para 200.
#Além disso, mudamos a linha de sólida para traço e traço.
#Outro ponto é que mudamos o tamanho da bola de acordo com os valores da lista z. Podemos mudar para o tamanho da lista y ou x, dependendo do que o mesmo deseja.
plt.scatter(x,y, label = 'Meus pontos', color = 'r', marker='.', s=z)
plt.plot(x,y, color='#009900', linestyle='--')
plt.legend()

#mostrando no gráfico como fico os valores no gráfico de linhas
plt.show()













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