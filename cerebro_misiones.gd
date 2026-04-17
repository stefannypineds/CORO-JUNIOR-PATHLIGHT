extends Node

# --- SEÑALES ---
signal mostrar_diploma

# --- VARIABLES ---
var nombre_jugador : String = ""
var nivel_maximo : int = 1  # <--- ESTA LÍNEA ARREGLA EL ERROR ROJO

# Tus misiones (Basadas en tu proyecto)
var m1 = MisionBase.new(["Ovejas", "Biblia", "Binoculares","Pintura2"])
var m2 = MisionBase.new(["Paso", "Pintura", "Biblia2","Binoculares2","Pez"])
var m3 = MisionBase.new(["Familia orando", "Biblia", "Pintura","Binoculares"])
var m4 = MisionBase.new(["Biblia", "Binoculares", "Pintura","Nube","Moises","David","Jesus"])
var m5 = MisionBase.new(["Biblia2", "Binoculares2", "Pintura2","Familia"])
var m6 = MisionBase.new(["modelo regalo", "Rosa", "Biblia","Binoculares","Pintura"])
var m7 = MisionBase.new(["Biblia", "Pintura", "Canasta peces","Binoculares"])
var m8 = MisionBase.new(["Biblia2","Pintura2","Binoculares2","Modelo+corazon"])

# --- FUNCIONES DE JUEGO ---

# Llama a esta función para que aparezca la carpa
func _ready():
	# Al arrancar el juego, intentamos cargar el nombre del jugador inmediatamente
	cargar_partida()

# --- FUNCIONES DE CONTROL ---

func activar_victoria():
	# 1. Guardamos el progreso actual antes de celebrar
	guardar_partida()
	
	# 2. Emitimos la señal que la insignia está escuchando
	mostrar_diploma.emit()
	print("¡Victoria detectada! Avisando a la pantalla de insignia.")

# --- SISTEMA DE PERSISTENCIA (GUARDADO/LECTURA) ---

func guardar_partida():
	var archivo = FileAccess.open("user://guardado.save", FileAccess.WRITE)
	if archivo:
		# Guardamos línea por línea: 1. Nombre, 2. Nivel
		archivo.store_line(nombre_jugador)
		archivo.store_line(str(nivel_maximo))
		archivo.close()
		print("Partida guardada correctamente en el disco.")

func cargar_partida():
	if FileAccess.file_exists("user://guardado.save"):
		var archivo = FileAccess.open("user://guardado.save", FileAccess.READ)
		if archivo:
			# Leemos exactamente en el mismo orden que guardamos
			nombre_jugador = archivo.get_line()
			
			var nivel_leido = archivo.get_line()
			if nivel_leido != "":
				nivel_maximo = int(nivel_leido)
				
			archivo.close()
			print("Cerebro: Datos cargados. Bienvenido de nuevo, " + nombre_jugador)
	else:
		print("Cerebro: No se encontró archivo de guardado previo.")
