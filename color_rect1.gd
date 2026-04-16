extends ColorRect

func _on_button_pressed() -> void:
	hide()
	CerebroMisiones.m7.registrar_clic("Biblia")
