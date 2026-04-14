extends Area3D

# Esta variable aparecerá en el inspector para que arrastres tu cuadro blanco
@export var cuadro_texto: Control 

func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	# Detectamos el clic izquierdo del mouse
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		
		if cuadro_texto != null:
			cuadro_texto.show() # Mostramos el cuadro
			
			# Calculamos la posición 2D encima de la oveja 3D
			var posicion_pantalla = camera.unproject_position(global_position + Vector3(0, 1.5, 0))
			
			# Centramos el cuadro
			cuadro_texto.global_position = posicion_pantalla - (cuadro_texto.size / 2.0)
