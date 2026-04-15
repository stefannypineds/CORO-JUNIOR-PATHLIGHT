extends ColorRect

func _on_button_pressed() -> void:
	hide() 
	
	CerebroMisiones.Paso = true
	CerebroMisiones.revisar_mision2()
