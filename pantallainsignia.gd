extends Control

func _ready():
	# Cargamos los datos guardados
	CerebroMisiones.cargar_partida()
	
	# Ponemos el nombre del niño
	if CerebroMisiones.nombre_jugador != "":
		$LabelNombre.text = CerebroMisiones.nombre_jugador
	else:
		$LabelNombre.text = "Explorador"
	
	# Ponemos la fecha de hoy
	var t = Time.get_date_dict_from_system()
	$LabelFecha.text = "%02d/%02d/%d" % [t.day, t.month, t.year]
	
	# Acomodamos los textos (esto ayuda si no los ves)
	$LabelNombre.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	$LabelFecha.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
