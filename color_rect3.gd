extends ColorRect

func _on_button_pressed() -> void:
	hide() 
	CerebroMisiones.Ovejas = true
	CerebroMisiones.revisar_mision()
