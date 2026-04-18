extends CanvasLayer

func _ready() -> void:
	# El mapa grande empieza oculto
	$MapaVistaGrandeLayer.hide()
	
	# Aseguramos que el boton empiece sincronizado con la musica sonando
	$BotonMusica.button_pressed = false

# Esta es para el mapita chiquito
func _on_boton_mapa_icono_pressed() -> void:
	$MapaVistaGrandeLayer.show()
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

# Esta es para la X
func _on_button_pressed() -> void:
	$MapaVistaGrandeLayer.hide()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

# Esta es la nueva para apagar/prender la musica
func _on_boton_musica_toggled(toggled_on: bool) -> void:
	if toggled_on:
		# Si se activa el boton, pausamos la musica
		MusicaFondo.stream_paused = true
	else:
		# Si se desactiva, la musica sigue sonando
		MusicaFondo.stream_paused = false
