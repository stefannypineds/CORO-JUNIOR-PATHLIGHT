extends TextureRect

func _ready() -> void:
	# REGLA: Cambia "mX" por la misión de este mapa (m1, m2, m3...)
	CerebroMisiones.m5.insignia = self

func _on_button_pressed() -> void:
	hide() # Replace with function body.
