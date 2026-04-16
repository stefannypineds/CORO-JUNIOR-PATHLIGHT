extends TextureRect

func _ready() -> void:
	# "Cerebro, yo soy la insignia de la misión 6"
	CerebroMisiones.m6.insignia = self

func _on_button_pressed() -> void:
	hide() # Esto es para el botón de cerrar (la X)
	
