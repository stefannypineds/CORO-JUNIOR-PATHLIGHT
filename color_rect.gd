extends ColorRect

func _on_button_pressed() -> void:
	hide() 
	CerebroMisiones.m5.registrar_clic("Familia")
