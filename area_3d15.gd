extends Area3D

func _on_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	
	# Comprobamos si el jugador hizo clic izquierdo
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		
		# ¡MAGIA! Esto abre el navegador con el video
		OS.shell_open("https://www.youtube.com/watch?v=dmn6x5-yRGg&list=RDEMKYB1mZkF79w3fPFja-Epow&start_radio=1")
		CerebroMisiones.m6.registrar_clic("Binoculares")
