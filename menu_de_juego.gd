extends Control

# 1. Botón de Nueva Partida (Te lleva a elegir personaje)
func _on_nueva_partida_button_pressed():
	get_tree().change_scene_to_file("res://SeleccionPersonaje.tscn")

# 2. Botón de Salir (Cierra el juego)
func _on_salir_button_pressed():
	get_tree().quit()

# --- OPCIONALES (Por si quieres que David vea que avanzaste más) ---

func _on_opciones_button_pressed():
	print("Aquí iría el menú de volumen y gráficos")

func _on_cargar_partida_button_pressed():
	print("Aquí se cargaría el archivo de guardado")
