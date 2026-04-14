extends Control

func _on_salir_pressed():
	# Esto te regresa al menú de inicio
	get_tree().change_scene_to_file("res://menu_de_juego.tscn")
