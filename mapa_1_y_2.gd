extends Node3D

func _ready():
	# 1. Mensaje de seguridad para ver qué eligió el jugador
	print("DEBUG: En el Global dice: ", Global.personaje_seleccionado)

	# 2. Referencias a tus nodos (Usamos comillas por los espacios)
	var niña = get_node("MODELO NIÑA")
	var niño = get_node("JUGADOR NIÑO")

	# 3. La lógica de encendido y apagado
	if Global.personaje_seleccionado == "Joy":
		# PRENDEMOS A LA CHINA
		niña.show()
		niña.process_mode = Node.PROCESS_MODE_INHERIT
		
		# APAGAMOS AL PELADO
		niño.hide()
		niño.process_mode = Node.PROCESS_MODE_DISABLED
		
		# Forzamos que la cámara de la niña sea la principal
		var cam_niña = niña.find_child("Camera3D", true)
		if cam_niña: cam_niña.make_current()
		
		print("¡MODELO NIÑA EN CONTROL!")

	else:
		# PRENDEMOS AL PELADO
		niño.show()
		niño.process_mode = Node.PROCESS_MODE_INHERIT
		
		# APAGAMOS A LA CHINA
		niña.hide()
		niña.process_mode = Node.PROCESS_MODE_DISABLED
		
		# Forzamos que la cámara del niño sea la principal
		var cam_niño = niño.find_child("Camera3D", true)
		if cam_niño: cam_niño.make_current()
		
		print("¡JUGADOR NIÑO EN CONTROL!")
