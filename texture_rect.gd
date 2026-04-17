extends TextureRect

func _ready() -> void:
	# Nos aseguramos de que el diploma arranque invisible
	hide() 
	CerebroMisiones.m1.insignia = self
	
	# Nos conectamos a la señal general de victoria del Cerebro
	CerebroMisiones.mostrar_diploma.connect(_aparecer)

# Esta función se activa SOLA cuando el jugador cumple el objetivo del mapa
func _aparecer() -> void:
	show()

# Este es tu botón (probablemente la "X" para cerrar o "Continuar")
func _on_button_pressed() -> void:
	hide()
	
	# ¡Aquí es un excelente lugar para enviar al jugador de vuelta!
	# get_tree().change_scene_to_file("res://Menu_de_seleccion_nivel.tscn")
