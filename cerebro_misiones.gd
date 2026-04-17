extends Node

# --- SEÑALES ---
signal mostrar_diploma

# --- VARIABLES ---
var nombre_jugador : String = ""
var nivel_maximo : int = 1  # <--- ESTA LÍNEA ARREGLA EL ERROR ROJO

# Tus misiones (Basadas en tu proyecto)
var m1 = MisionBase.new(["Ovejas", "Biblia", "Binoculares"])
var m2 = MisionBase.new(["Paso", "Pintura", "Biblia2"])
var m3 = MisionBase.new(["Familia orando", "Biblia", "Pintura"])
var m4 = MisionBase.new(["Biblia", "Binoculares", "Pintura"])
var m5 = MisionBase.new(["Biblia2", "Binoculares2", "Pintura2"])
var m6 = MisionBase.new(["modelo regalo", "Rosa", "Biblia"])
var m7 = MisionBase.new(["Biblia", "Pintura", "Canasta"])

# --- FUNCIONES DE JUEGO ---

# Llama a esta función para que aparezca la carpa
func activar_victoria():
	guardar_partida()
	mostrar_diploma.emit()
	print("Señal de victoria enviada")

# --- GUARDAR Y CARGAR DEL DISCO ---

func guardar_partida():
	var archivo = FileAccess.open("user://guardado.save", FileAccess.WRITE)
	if archivo:
		archivo.store_line(nombre_jugador)
		archivo.store_line(str(nivel_maximo)) # También guardamos el nivel
		archivo.close()
		print("Datos guardados con éxito.")

func cargar_partida():
	if FileAccess.file_exists("user://guardado.save"):
		var archivo = FileAccess.open("user://guardado.save", FileAccess.READ)
		if archivo:
			nombre_jugador = archivo.get_line()
			var nivel_leido = archivo.get_line()
			if nivel_leido != "":
				nivel_maximo = int(nivel_leido)
			archivo.close()
			print("Datos cargados. Nombre: " + nombre_jugador)
