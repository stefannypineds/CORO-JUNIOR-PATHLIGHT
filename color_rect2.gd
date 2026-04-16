extends ColorRect

func _on_button_pressed() -> void:
	hide()
	CerebroMisiones.m2.registrar_clic("Biblia2")


func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	pass # Replace with function body.
