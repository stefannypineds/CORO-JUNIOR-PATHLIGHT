extends Control

# --- FUNCIONES DE LOS BOTONES ---

func _on_nueva_partida_pressed() -> void:
	# Esta línea es la que hace la magia de cambiar de pantalla
	# Asegúrate de que el nombre del archivo sea exactamente este
	get_tree().change_scene_to_file("res://SeleccionPersonaje.tscn")

func _on_reanudar_partida_pressed() -> void:
	# Por si quieres que reanudar vaya directo al nivel 1
	get_tree().change_scene_to_file("res://SeleccionNivel.tscn")

func _on_ayuda_pressed():
	get_tree().change_scene_to_file("res://Ayuda.tscn")

func _on_creditos_button_pressed() -> void:
	# Cerramos el juego correctamente sin comillas extra
	get_tree().quit()


func _on_creditos_pressed() -> void:
	pass # Replace with function body.
