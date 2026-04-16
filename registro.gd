extends Control

func _ready() -> void:
	# Intentar cargar el nombre si ya existe uno guardado
	CerebroMisiones.cargar_partida()
	if CerebroMisiones.nombre_jugador != "":
		$LineEdit.text = CerebroMisiones.nombre_jugador

func _on_button_pressed() -> void:
	var caja_nombre = $LineEdit
	
	if caja_nombre.text.strip_edges() != "":
		# Guardamos en la variable y luego en el disco
		CerebroMisiones.nombre_jugador = caja_nombre.text
		CerebroMisiones.guardar_partida() 
		
		# Cambiamos de escena (Asegúrate que el nombre del archivo sea idéntico)
		get_tree().change_scene_to_file("res://Menu_de_juego.tscn")
	else:
		print("Por favor, escribe un nombre")
