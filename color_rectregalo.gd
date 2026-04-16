extends ColorRect

func _on_button_pressed() -> void:
	hide()
	CerebroMisiones.m6.registrar_clic("modelo regalo")
