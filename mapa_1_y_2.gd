extends Node3D

func _ready():
	# Mensajes para que tú mismo veas qué está pasando en la consola
	print("--- MAPA CARGADO ---")
	print("El Global dice que el personaje es: ", Global.personaje_seleccionado)

	# 1. Definimos las rutas de tus escenas
	var ruta_niño = "res://JUGADOR NIÑO.tscn"
	var ruta_niña = "res://MODELO NIÑA.tscn"
	var escena_a_cargar

	# 2. El "Interruptor" que decide
	if Global.personaje_seleccionado == "Joy":
		escena_a_cargar = load(ruta_niña)
		print("Cargando Escena: MODELO NIÑA")
	else:
		# Si no es Joy (o si hay error), cargamos a Theo
		escena_a_cargar = load(ruta_niño)
		print("Cargando Escena: JUGADOR NIÑO (Por defecto)")

	# 3. Ponemos al personaje en el mundo
	if escena_a_cargar:
		var personaje = escena_a_cargar.instantiate()
		add_child(personaje)
		
		# IMPORTANTE: Cambia estos números a la posición de inicio de tu nivel
		# personaje.global_position = Vector3(0, 5, 0)
	else:
		print("ERROR: No se encontró ninguno de los archivos .tscn")
