extends Area3D

# 1. Creamos la "cajita" en el inspector para arrastrar nuestro cuadro blanco
@export var cuadro_texto: Control 

func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	
	# 2. Comprobamos si el jugador hizo clic izquierdo
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		
		# 3. Verificamos que sí conectamos el cuadro en el inspector
		if cuadro_texto != null:
			cuadro_texto.show() # Hacemos visible el cuadro
			
			# 4. Calculamos dónde ponerlo (arriba de la oveja y centrado)
			var posicion_pantalla = camera.unproject_position(global_position + Vector3(0, 1.5, 0))
			cuadro_texto.global_position = posicion_pantalla - (cuadro_texto.size / 2.0)
