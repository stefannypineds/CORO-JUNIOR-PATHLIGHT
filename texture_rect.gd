extends TextureRect

func _ready() -> void:
	# Se conecta al cerebro al inicio
	CerebroMisiones.insignia_visual = self

func _on_button_pressed() -> void:
	hide() # ¡Esto hace que se cierre cuando le den a la X!
