extends Control

func _ready() -> void:
	var nivel_alcanzado = GuardadoManager.nivel_maximo
	print("=== INICIANDO MENÚ ===")
	print("El jugador va en el nivel: ", nivel_alcanzado)
	
	for i in range(1, 9):
		var boton = get_node("TextureRect/Button" + str(i)) 
		
		if i <= nivel_alcanzado:
			# BOTONES DESBLOQUEADOS (ORO)
			boton.disabled = false 
			boton.mouse_filter = Control.MOUSE_FILTER_STOP # ¡Atrapa el clic!
			
			if not boton.pressed.is_connected(_al_presionar_nivel):
				boton.pressed.connect(_al_presionar_nivel.bind(i))
				
		else:
			# BOTONES BLOQUEADOS (CANDADO)
			boton.disabled = true  
			boton.mouse_filter = Control.MOUSE_FILTER_IGNORE # ¡Modo fantasma activado!

func _al_presionar_nivel(numero_nivel: int) -> void:
	print("¡Clic exitoso! Viajando al nivel: ", numero_nivel)
	
	# Directorio de viajes a tus mapas exactos
	match numero_nivel:
		1:
			get_tree().change_scene_to_file("res://MAPA 1 Y 2.tscn")
		2:
			get_tree().change_scene_to_file("res://MAPA 1 Y 2.tscn")
		3:
			get_tree().change_scene_to_file("res://MAPA 3.tscn")
		4:
			get_tree().change_scene_to_file("res://MAPA 3 Y 4.tscn")
		5:
			get_tree().change_scene_to_file("res://MAPA 3 Y 4.tscn")
		6:
			get_tree().change_scene_to_file("res://MAPA 6.tscn")
		7:
			get_tree().change_scene_to_file("res://MAPA 7 Y 8.tscn")
		8:
			get_tree().change_scene_to_file("res://MAPA 7 Y 8.tscn")
