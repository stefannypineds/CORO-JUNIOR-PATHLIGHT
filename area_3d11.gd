extends Area3D

func _on_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		
		# Abre el video en el navegador del celular
		OS.shell_open("https://youtu.be/7qGK_KcWAeY?si=IhM-1NVTkUNjZ82-")
		
		CerebroMisiones.m2.registrar_clic("Binoculares2")
