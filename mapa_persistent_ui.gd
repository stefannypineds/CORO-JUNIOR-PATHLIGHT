extends CanvasLayer

func _ready() -> void:
	# El mapa grande empieza oculto
	$MapaVistaGrandeLayer.hide()

# Esta es para el mapita chiquito
func _on_boton_mapa_icono_pressed() -> void:
	$MapaVistaGrandeLayer.show()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

# Esta es para la X
func _on_button_pressed() -> void:
	$MapaVistaGrandeLayer.hide()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
