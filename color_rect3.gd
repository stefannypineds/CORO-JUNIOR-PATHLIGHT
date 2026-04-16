extends ColorRect

func _on_button_pressed() -> void:
	hide() 
	CerebroMisiones.m1.registrar_clic("Ovejas")
