extends ColorRect

func _on_button_pressed() -> void:
	hide()
	CerebroMisiones.Biblia2 = true
	CerebroMisiones.revisar_mision2()
