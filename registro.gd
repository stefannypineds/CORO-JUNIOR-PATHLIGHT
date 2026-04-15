extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	var caja_nombre = $LineEdit
	
	if caja_nombre.text != "":
		CerebroMisiones.nombre_jugador = caja_nombre.text
		CerebroMisiones.guardar_partida() 
		
		# Teletransporte a tu menú principal (Asegúrate de que el nombre del archivo sea el correcto)
		get_tree().change_scene_to_file("res://Menu_de_juego.tscn")
