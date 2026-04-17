extends Control

# Esta variable la recibe del mapa (1, 2, etc.)
var numero_de_insignia : int = 1 

func _ready():
	# 1. PONER EL NOMBRE
	# Traemos el nombre que guardaste en el registro
	if CerebroMisiones.nombre_jugador != "":
		$LabelNombre.text = "¡Felicidades, " + CerebroMisiones.nombre_jugador + "!"
	else:
		$LabelNombre.text = "¡Felicidades, Explorador!"

	# 2. PONER LA FECHA
	# Esto toma la fecha de la computadora/celular
	var t = Time.get_date_dict_from_system()
	$LabelFecha.text = "Logrado el: %02d/%02d/%d" % [t.day, t.month, t.year]
	
	# 3. CARGAR LA IMAGEN
	var ruta = "res://INSIGNIA " + str(numero_de_insignia) + ".png"
	if FileAccess.file_exists(ruta):
		$TextureRect.texture = load(ruta)
