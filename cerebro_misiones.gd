extends Node

# La lista con tus nombres exactos
var Ovejas = false
var Biblia = false
var Binoculares = false
var Pintura2 = false

var insignia_visual: Control

func revisar_mision():
	# Revisa si los 4 ya están verdaderos (true)
	if Ovejas and Biblia and Binoculares and Pintura2:
		if insignia_visual != null:
			insignia_visual.show()
