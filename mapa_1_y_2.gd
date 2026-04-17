extends Node3D

func _ready():
	await get_tree().create_timer(0.1).timeout
	
	var nino = find_child("jugador niño", true, false)
	var nina = find_child("modelo niña", true, false)
	
	if nino == null or nina == null:
		print("❌ Error: Revisa los nombres de los nodos")
		return

	if Global.personaje_seleccionado == "Joy":
		print("👗 ACTIVANDO A JOY")
		# Prender Niña
		nina.show()
		nina.process_mode = Node.PROCESS_MODE_INHERIT
		var cam_joy = nina.find_child("Camera3D", true, false)
		if cam_joy: cam_joy.make_current()
		
		# Apagar Niño
		nino.hide()
		nino.process_mode = Node.PROCESS_MODE_DISABLED
	else:
		print("👦 ACTIVANDO A THEO")
		# Prender Niño
		nino.show()
		nino.process_mode = Node.PROCESS_MODE_INHERIT
		var cam_theo = nino.find_child("Camera3D", true, false)
		if cam_theo: cam_theo.make_current()
		
		# Apagar Niña
		nina.hide()
		nina.process_mode = Node.PROCESS_MODE_DISABLED
