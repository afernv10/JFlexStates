# JFlexStates
3a práctica de la asignatura de procesadores de lenguaje. Uso de JFlex con Estados

Autor: afernv10
Practica: Practica 3 - JFlex

Un fichero de entrada de ejemplo está en la carpeta raiz del proyecto.
Ahora mismo en la carpeta del proyecto están creados todos los .java de cada .jflex

Para ejecutar el ejercicio (obteniendo el estado actual) he seguido estos pasos:
	1. Con el .jflex creo una configuración de ejecución.
		Run>External Tools>External tools Configurations...
	2. En Location pongo la ruta al .bat de jflex (C:\Users\ander\jflex-1.8.1\bin\jflex.bat)
	3. En Working Directory selecciono del workspace el package del ejercicio.
	4. Como argumento pongo el nombre del archivo jflex (ejStates.jflex, ...)
	(5. Le doy a la opción de Refresh para que se actualice el proyecto al Dar a Run)
	6. Hecho esto creo la configuración para el .java creado.
		Run>Run Configurations...
	7. Creo una config para el lexer, seleccionando el proyecto JFlexPL3
	8. En cada configuración selecciono del workspace la Main class
	9. Como argumento de entrada especifico el .txt del ejercicio (entrada.txt)
	10. Ejecutamos normalmente en el Play seleccionando la config del ejercicio. 
		Podemos probar a cambiar los textos de la entrada.
