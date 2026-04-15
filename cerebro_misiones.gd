extends Node

# --- MISIÓN 1 ---
var Ovejas = false
var Biblia = false
var Binoculares = false
var Pintura2 = false

var insignia_visual: Control

# --- MISIÓN 2 ---
# Pon aquí los nombres de tus 4 nuevos elementos de la escena 2
var Biblia2 = false
var Paso = false
var ObjetoM2_3 = false
var ObjetoM2_4 = false
var insignia_visual2: Control # Esta es la insignia 2

func revisar_mision():
	# Lógica para la Insignia 1
	if Ovejas and Biblia and Binoculares and Pintura2:
		if insignia_visual != null:
			insignia_visual.show()

func revisar_mision2():
	# Lógica para la Insignia 2
	if Biblia2 and Paso and ObjetoM2_3 and ObjetoM2_4:
		if insignia_visual2 != null:
			insignia_visual2.show()
