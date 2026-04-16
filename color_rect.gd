extends ColorRect

func _on_button_pressed() -> void:
	hide() 
	CerebroMisiones.m2.registrar_clic("Pez")
