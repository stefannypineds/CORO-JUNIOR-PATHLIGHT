extends Node3D

@export var destino: Marker3D
@export var duracion: float = 8.0
@export var el_nino: CharacterBody3D # Arrastra al niño aquí en el Inspector

func _on_area_3d_input_event(_camera, event, _pos, _norm, _idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		subir_al_nino()
		mover_barco()

func subir_al_nino():
	# 1. Quitamos al niño del mapa general
	el_nino.get_parent().remove_child(el_nino)
	# 2. Lo metemos dentro de la canoa
	add_child(el_nino)
	# 3. Lo ponemos en una posición cómoda (0,0,0 es el centro de la barca)
	el_nino.position = Vector3(0, 0.5, 0) 
	print("Niño a bordo")

func mover_barco():
	var tween = create_tween()
	tween.tween_property(self, "global_position", destino.global_position, duracion)
	# Cuando termine de moverse, llamamos a la función para bajarlo
	tween.finished.connect(bajar_al_nino)

func bajar_al_nino():
	# Hacemos lo contrario: lo sacamos de la canoa y lo devolvemos al mapa
	var mapa = get_parent()
	var posicion_actual = el_nino.global_position
	
	remove_child(el_nino)
	mapa.add_child(el_nino)
	
	# Le devolvemos su posición real en el mundo
	el_nino.global_position = posicion_actual
	print("El niño ha desembarcado")
