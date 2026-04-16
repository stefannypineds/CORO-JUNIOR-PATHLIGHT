extends ColorRect

func _on_button_pressed() -> void:
	hide() 
	CerebroMisiones.m8.registrar_clic("Biblia2")
