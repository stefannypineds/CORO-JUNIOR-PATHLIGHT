extends Control

func _on_theo_button_pressed():
	Global.personaje_seleccionado = "Theo"
	print("--- CLICK EN THEO: ", Global.personaje_seleccionado, " ---")
	get_tree().change_scene_to_file("res://SeleccionNivel.tscn")

func _on_joy_button_pressed():
	Global.personaje_seleccionado = "Joy"
	print("--- CLICK EN JOY: ", Global.personaje_seleccionado, " ---")
	get_tree().change_scene_to_file("res://SeleccionNivel.tscn")
