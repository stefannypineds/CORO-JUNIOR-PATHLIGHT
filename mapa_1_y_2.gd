extends Node3D

func _ready():
	await get_tree().create_timer(0.2).timeout
	
	var nino = null
	var nina = null

	# Buscamos en todos los hijos del mapa quién tiene cada script
	for hijo in get_children():
		if hijo is CharacterBody3D:
			if "NIÑO" in hijo.get_script().get_path().to_upper():
				nino = hijo
			elif "NIÑA" in hijo.get_script().get_path().to_upper():
				nina = hijo

	if nino == null or nina == null:
		print("❌ ERROR: Sigo sin detectar los cuerpos 3D. Revisa que estén en la raíz del mapa.")
		return

	# Aplicamos la selección del Global
	if Global.personaje_seleccionado == "Joy":
		print("✅ Activando MODELO NIÑA")
		nina.show()
		nina.process_mode = Node.PROCESS_MODE_INHERIT
		nino.hide()
		nino.process_mode = Node.PROCESS_MODE_DISABLED
	else:
		print("✅ Activando JUGADOR NIÑO")
		nino.show()
		nino.process_mode = Node.PROCESS_MODE_INHERIT
		nina.hide()
		nina.process_mode = Node.PROCESS_MODE_DISABLED
