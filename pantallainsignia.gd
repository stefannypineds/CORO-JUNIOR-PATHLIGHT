extends Control

func _ready():
	# IMPORTANTE: La insignia se esconde al empezar el mapa
	hide()
	
	# Se conecta al cerebro para esperar la orden
	if CerebroMisiones.has_signal("mostrar_diploma"):
		CerebroMisiones.mostrar_diploma.connect(_on_victoria_recibida)

func _on_victoria_recibida():
	# 1. Carga el nombre del archivo
	CerebroMisiones.cargar_partida()
	
	# 2. Actualiza los textos
	if CerebroMisiones.nombre_jugador != "":
		$LabelNombre.text = "¡Felicidades, " + CerebroMisiones.nombre_jugador + "!"
	else:
		$LabelNombre.text = "¡Felicidades, Explorador!"
	
	var t = Time.get_date_dict_from_system()
	$LabelFecha.text = "Logrado el: %02d/%02d/%d" % [t.day, t.month, t.year]
	
	# 3. ¡Se hace visible!
	show()

# Para cerrar la insignia al hacer clic
func _input(event):
	if is_visible_in_tree() and event is InputEventMouseButton and event.pressed:
		hide()
