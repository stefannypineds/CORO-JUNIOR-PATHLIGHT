extends Area3D

# Esta cajita nos va a pedir el cuadro de texto en el inspector
@export var cuadro_texto: Control 

func _on_input_event(camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	
	# Comprobamos si el jugador hizo clic izquierdo
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		
		# Verificamos que el cuadro sí esté conectado en el inspector
		if cuadro_texto != null:
			cuadro_texto.show() # Lo hacemos visible
			
			# Calculamos dónde ponerlo (arriba de la oveja y centrado)
			var posicion_pantalla = (camera as Camera3D).unproject_position(global_position + Vector3(0, 1.5, 0))
			cuadro_texto.global_position = posicion_pantalla - (cuadro_texto.size / 2.0)
