extends ColorRect

func _on_button_pressed() -> void:
	hide()
	CerebroMisiones.m4.registrar_clic("Biblia")
