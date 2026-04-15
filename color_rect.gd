extends ColorRect

func _on_button_pressed() -> void:
	hide() 
	CerebroMisiones.Biblia = true
	CerebroMisiones.revisar_mision()
