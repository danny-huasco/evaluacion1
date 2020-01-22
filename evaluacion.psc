Funcion validador <- salir () // funcion de termino del programa
	Repetir
		Escribir 'desea ejecutar otra opcion? (s/n)'
		Leer resp
		Si (resp=='s' O resp=='S') Entonces
			validador <- falso
		SiNo
			Si (resp=='n' O resp=='N') Entonces
				validador <- verdadero
			SiNo
				Escribir 'ingrese opcion valida'
			FinSi
		FinSi
	Hasta Que (resp=='n' O resp=='N' O resp=='s' O resp=='S')
FinFuncion

Funcion alumnos_curso ()
	Escribir 'ingrese cantidad de alumnos'
	Leer N
	Dimension alumnos[N,4]
	Para i<-1 Hasta N Hacer // llenado del arreglo
		Escribir 'ingrese nombre, rut, fono y email respectivamente'
		Para j<-1 Hasta 4 Hacer
			Leer alumnos[i,j]
		FinPara
	FinPara
	Para i<-1 Hasta N Hacer // escritura lateral de datos de alumnos
		Para j<-1 Hasta 4 Hacer
			Escribir alumnos[i,1],' ',alumnos[i,2],' ',alumnos[i,3],' ',alumnos[i,4],' ' Sin Saltar
			Escribir ''
		FinPara
	FinPara
FinFuncion

Funcion curso_td ()
	Escribir 'ingrese cantidad de alumnos'
	Leer N
	Dimension alumnos[N]
	Para i<-1 Hasta N Hacer // llenado de arreglo
		Escribir 'ingrese nombre de alumno'
		Leer alumnos[i]
	FinPara
	Para i<-1 Hasta N Hacer // escritura lateral de 5 alumnos, luego salto de linea
		Escribir alumnos[i],' ' Sin Saltar
		Si (i MOD 5==0) Entonces // validacion que sean solo 5 por fila
			Escribir ''
		FinSi
	FinPara
	Escribir ''
FinFuncion

Funcion nombres_repetidos ()
	Dimension a[10],repetidos[10]
	flag <- falso
	f <- 1 // variable para avanzar en el arreglo de repetidos
	Para i<-1 Hasta 10 Hacer // llenado de arreglo de nombres
		Escribir 'ingrese un nombre'
		Leer nombre
		a[i] <- nombre
	FinPara
	Para j<-1 Hasta 9 Hacer
		aux <- a[j] // toma un nombre y lo compara con los siguientes en la lista
		Para k<-j+1 Hasta 9 Hacer
			Si (aux==a[k]) Entonces // si encuentra repetido, busca en arreglo de repetidos,
				flag <- verdadero
				Para h<-1 Hasta 9 Hacer
					Si (aux==repetidos[h]) Entonces
						flag2 <- verdadero
					SiNo
						flag2 <- falso // validar existencia en arreglo de repetidos						
					FinSi
				FinPara
				Si (flag2==falso) Entonces
					repetidos[f] <- aux // ingreso a arreglo de repetidos
					f <- f+1 // aumenta un espacio en arreglo repetidos
				FinSi
			FinSi
		FinPara
	FinPara
	Para g<-1 Hasta 10 Hacer // mostrar arreglo de repetidos
		Escribir repetidos[g],' ' Sin Saltar
	FinPara
	Si (flag==falso) Entonces // caso en que no se encuentren repeticiones
		Escribir 'no se encontraron nombres repetidos'
	FinSi
	Escribir ''
FinFuncion

Funcion nombres_con_J ()
	cont <- 0
	Repetir
		Repetir // validacion de que el nombre comience con J
			Escribir 'ingresa un nombre con J'
			Leer nomb
			inicial <- SubCadena(nomb,1,1) // evaluacion de primera letra
			Si (inicial=='j' O inicial=='J') Entonces // validacion de primera letra
				Si (nomb=='Juan' O nomb=='juan' O nomb=='JUAN') Entonces
					Escribir 'ganaste'
					Escribir 'usaste',cont,' intentos antes de acertar'
				SiNo
					cont <- cont+1 // contador de nombres distintos de juan
				FinSi
			SiNo
				Escribir 'recuerda que debe empezar con J' // mensaje de error por primera letra distinta de j
			FinSi
		Hasta Que (inicial=='j' O inicial=='J')
	Hasta Que (nomb=='Juan' O nomb=='juan' O nomb=='JUAN')
FinFuncion

Funcion promedio_N ()
	Escribir 'ingrese cuantos numeros desee, para terminar proceso ingrese un cero (0)'
	num <- 1
	Mientras (num!=0) Hacer // ciclo hasta que ingresen cero
		Leer num
		Si (num!=0) Entonces
			cont <- cont+1 // contador de numeros ingresados
			suma <- suma+num
		FinSi
	FinMientras
	Escribir 'ud ingresó ',cont,' numeros, y el promedio entre ellos es ',suma/cont
FinFuncion

Funcion num_palabra ()
	Repetir
		flag <- verdadero
		Escribir 'ingrese un numero del 1 al 10'
		Leer num
		Segun num  Hacer
			1:
				palabra <- 'uno'
			2:
				palabra <- 'dos'
			3:
				palabra <- 'tres'
			4:
				palabra <- 'cuatro'
			5:
				palabra <- 'cinco'
			6:
				palabra <- 'seis'
			7:
				palabra <- 'siete'
			8:
				palabra <- 'ocho'
			9:
				palabra <- 'nueve'
			10:
				palabra <- 'diez'
			De Otro Modo:
				flag <- falso
				Escribir 'número no valido'
		FinSegun
	Hasta Que (flag==verdadero)
	Escribir palabra
FinFuncion

Funcion cobro <- cobro_bano (opc)
	Repetir
		flag <- verdadero
		Si (opc==1) Entonces
			cobro <- 250
		SiNo
			Si (opc==2) Entonces
				cobro <- 2500
			SiNo
				Si (opc==3) Entonces
					cobro <- 2750
				SiNo
					flag <- falso
					Escribir 'ingrese una opcion valida'
				FinSi
			FinSi
		FinSi
	Hasta Que (flag==verdadero)
FinFuncion

Funcion acceso_bano ()
	Escribir 'ingrese nombre, genero y servicio a utilizar (1.- baño/ 2.- ducha/ 3.- ambos)'
	Leer nombre,genero,opc
	Si (genero=='masculino') Entonces
		Escribir 'El Sr. ',nombre,'debe pasar al baño de hombres y cancelar ',cobro_bano(opc)
	SiNo
		Si (genero=='femenino') Entonces
			Escribir 'La Srta. ',nombre,' debe pasar al baño de mujeres y cancelar $',cobro_bano(opc)
		SiNo
			Escribir 'genero no comprendido en nuestras opciones'
		FinSi
	FinSi
FinFuncion

Funcion promedio_num ()
	Escribir 'ingrese 3 numeros'
	Leer a,b,c
	Escribir 'el promedio es ',(a+b+c)/3
FinFuncion

Algoritmo tarea
	Repetir
		flag <- verdadero
		Escribir 'escoja una opción'
		Escribir '1.- promedio 3 numeros'
		Escribir '2.- Acceso al baño'
		Escribir '3.- numero en palabras'
		Escribir '4.- promedio de N numeros'
		Escribir '5.- nombres con J'
		Escribir '6.- nombres repetidos'
		Escribir '7.- participantes curso'
		Escribir '8.- datos alumnos'
		Escribir '9.- salir'
		Leer opc
		Segun opc  Hacer
			1:
				promedio_num()
				flag <- salir()
			2:
				acceso_bano()
				flag <- salir()
			3:
				num_palabra()
				flag <- salir()
			4:
				promedio_N()
				flag <- salir()
			5:
				nombres_con_J()
				flag <- salir()
			6:
				nombres_repetidos()
				flag <- salir()
			7:
				curso_td()
				flag <- salir()
			8:
				alumnos_curso()
				flag <- salir()
			9:
			De Otro Modo:
				flag <- falso
				Escribir 'número no valido'
		FinSegun
		Borrar Pantalla
	Hasta Que (flag==verdadero)
FinAlgoritmo
