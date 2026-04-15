extends Node

# --- MISIÓN 1 ---
var Ovejas = false
var Biblia = false
var Binoculares = false
var Pintura2 = false

var insignia_visual: Control

# --- MISIÓN 2 ---
var Paso = false
var Pintura = false
var Biblia2 = false
var Binoculares2 = false
var Pez = false

var insignia_visual2: Control

# --- DATOS DEL JUGADOR ---
var nombre_jugador = "Explorador"


# REVISIÓN MISIÓN 1
func revisar_mision():
	if Ovejas and Biblia and Binoculares and Pintura2:
		if insignia_visual != null:
			insignia_visual.show()

# REVISIÓN MISIÓN 2
func revisar_mision2():
	# Aquí revisamos los 5 elementos de la segunda lista
	if Paso and Pintura and Biblia2 and Binoculares2 and Pez:
		if insignia_visual2 != null:
			insignia_visual2.show()
