extends Control

# Función para cuando presionan "Nueva Partida"
func _on_nueva_partida_pressed() -> void:
	# Nos lleva a la escena de selección de Theo y Joy
	get_tree().change_scene_to_file("res://SeleccionPersonaje.tscn")

# Función para cuando presionan "Reanudar Partida"
func _on_reanudar_partida_pressed() -> void:
	# Por ahora, que te mande directo al mapa principal
	get_tree().change_scene_to_file("res://MAPA 1 Y 2.tscn")

# Función para cuando presionan "Ayuda"
func _on_ayuda_pressed() -> void:
	# Aquí podrías abrir un panel o una escena de instrucciones
	print("Botón Ayuda presionado")

# Función para cuando presionan "Créditos" (o Salir)
func _on_creditos_button_pressed() -> void:
	# Aquí corregí el error de la comilla extra que tenías
	get_tree().quit()
