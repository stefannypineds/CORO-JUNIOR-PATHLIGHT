class_name MisionBase
extends RefCounted

var elementos: Dictionary = {}
var insignia: Control

func _init(nombres: Array):
	for nombre in nombres:
		elementos[nombre] = false

func registrar_clic(nombre: String):
	# Cuando el jugador da clic, marcamos como true
	elementos[nombre] = true
	
	# Revisamos si ya todos están en true
	for estado in elementos.values():
		if estado == false: return # Si falta uno, cortamos aquí
	
	# Si pasa la revisión, mostramos la insignia
	if insignia: 
		insignia.show()
