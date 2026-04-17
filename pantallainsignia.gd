extends Control

func _ready():
	hide() # Empieza oculto
	# ENLACE: Nos conectamos a la señal del cerebro
	CerebroMisiones.mostrar_diploma.connect(_al_recibir_victoria)

func _al_recibir_victoria():
	# Cargamos los datos para tener el nombre fresco
	CerebroMisiones.cargar_partida()
	
	# Ponemos el nombre del niño
	if CerebroMisiones.nombre_jugador != "":
		$LabelNombre.text = CerebroMisiones.nombre_jugador
	else:
		$LabelNombre.text = "Explorador"
	
	# Ponemos la fecha
	var t = Time.get_date_dict_from_system()
	$LabelFecha.text = "%02d/%02d/%d" % [t.day, t.month, t.year]
	
	# Aseguramos color negro y visibilidad
	$LabelNombre.add_theme_color_override("font_color", Color.BLACK)
	show() # ¡Aparece!
