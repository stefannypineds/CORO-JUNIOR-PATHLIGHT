extends Control

func _ready() -> void:
	pass 

func _process(_delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	var caja_nombre = $LineEdit
	
	# Verificamos que no esté vacío y que el "Cerebro" exista
	if caja_nombre.text != "":
		CerebroMisiones.nombre_jugador = caja_nombre.text
		CerebroMisiones.guardar_partida() 
		
		# Cambia a la escena del menú (Asegúrate que el nombre sea exacto)
		get_tree().change_scene_to_file("res://Menu_de_juego.tscn")
	else:
		print("Por favor, escribe un nombre")
