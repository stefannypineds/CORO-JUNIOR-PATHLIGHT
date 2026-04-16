extends Node

# Variable para el nombre
var nombre_jugador : String = ""

# Tus misiones (Mantengo las de tu imagen)
var m1 = MisionBase.new(["Ovejas", "Biblia", "Binoculares"])
var m2 = MisionBase.new(["Paso", "Pintura", "Biblia2"])
var m3 = MisionBase.new(["Familia orando", "Biblia", "Pintura"])
var m4 = MisionBase.new(["Biblia", "Binoculares", "Pintura"])
var m5 = MisionBase.new(["Biblia2", "Binoculares2", "Pintura2"])
var m6 = MisionBase.new(["modelo regalo", "Rosa", "Biblia"])
var m7 = MisionBase.new(["Biblia", "Pintura", "Canasta"])

# --- FUNCIÓN PARA GUARDAR EN EL DISCO ---
func guardar_partida():
	# Crea un archivo llamado "guardado.save" en la carpeta de usuario
	var archivo = FileAccess.open("user://guardado.save", FileAccess.WRITE)
	if archivo:
		archivo.store_line(nombre_jugador)
		archivo.close()
		print("Nombre guardado exitosamente en el disco.")

# --- FUNCIÓN PARA CARGAR DESDE EL DISCO ---
func cargar_partida():
	if FileAccess.file_exists("user://guardado.save"):
		var archivo = FileAccess.open("user://guardado.save", FileAccess.READ)
		nombre_jugador = archivo.get_line()
		archivo.close()
		print("Nombre cargado: " + nombre_jugador)
