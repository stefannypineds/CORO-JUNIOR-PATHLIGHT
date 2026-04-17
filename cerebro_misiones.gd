extends Node

# --- SEÑAL ---
signal mostrar_diploma

# --- VARIABLES ---
var nombre_jugador : String = ""

# Tus misiones
var m1 = MisionBase.new(["Ovejas", "Biblia", "Binoculares"])
var m2 = MisionBase.new(["Paso", "Pintura", "Biblia2"])
var m3 = MisionBase.new(["Familia orando", "Biblia", "Pintura"])
var m4 = MisionBase.new(["Biblia", "Binoculares", "Pintura"])
var m5 = MisionBase.new(["Biblia2", "Binoculares2", "Pintura2"])
var m6 = MisionBase.new(["modelo regalo", "Rosa", "Biblia"])
var m7 = MisionBase.new(["Biblia", "Pintura", "Canasta"])

# --- FUNCIÓN PARA MOSTRAR LA INSIGNIA ---
# Llama a esta función cuando quieras que la carpa aparezca
func activar_victoria():
	guardar_partida() # Asegura que el nombre esté guardado
	mostrar_diploma.emit() # Lanza la señal
	print("Señal de victoria enviada")

# --- GUARDAR Y CARGAR ---
func guardar_partida():
	var archivo = FileAccess.open("user://guardado.save", FileAccess.WRITE)
	if archivo:
		archivo.store_line(nombre_jugador)
		archivo.close()

func cargar_partida():
	if FileAccess.file_exists("user://guardado.save"):
		var archivo = FileAccess.open("user://guardado.save", FileAccess.READ)
		if archivo:
			nombre_jugador = archivo.get_line()
			archivo.close()
