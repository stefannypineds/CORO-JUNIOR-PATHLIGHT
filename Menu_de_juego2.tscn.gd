extends Control
func _on_timer_timeout():
	# Esta línea se ejecuta cuando pasan los 5 segundos
	get_tree().change_scene_to_file("res://Menu_de_juego.tscn")
