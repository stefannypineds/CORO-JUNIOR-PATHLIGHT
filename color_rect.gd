extends ColorRect

func _on_button_pressed() -> void:
	hide() 
	# Cambia la línea del error por estas dos:
	CerebroMisiones.Pez = true
	CerebroMisiones.revisar_mision2()
