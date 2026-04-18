extends TextureRect

func _ready() -> void:
	# REGLA: Cambia "mX" por la misión de este mapa (m1, m2, m3...)
	CerebroMisiones.m7.insignia = self
# Esto es lo nuevo para el nombre y la fecha
	actualizar_identidad_insignia()

func actualizar_identidad_insignia():
	# 1. Usamos 'nombre_jugador' que es como aparece en tu CerebroMisiones
	if CerebroMisiones.nombre_jugador != "":
		$LabelNombre.text = CerebroMisiones.nombre_jugador
	else:
		$LabelNombre.text = "Explorador"

	# 2. Ponemos la fecha del sistema
	var d = Time.get_date_dict_from_system()
	$LabelFecha.text = "%02d/%02d/%d" % [d.day, d.month, d.year]
func _on_button_pressed() -> void:
	hide() # Replace with function body.
