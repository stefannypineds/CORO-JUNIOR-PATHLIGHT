extends Control

# Esta variable decide qué dibujo mostrar (1 para Nivel 1, etc.)
var numero_de_insignia : int = 1 

func _ready():
	# 1. CARGAR DATOS: Esto va al "disco" a buscar el nombre que guardaste en el Registro
	CerebroMisiones.cargar_partida()
	
	# 2. ESCRIBIR EL NOMBRE:
	if CerebroMisiones.nombre_jugador != "":
		$LabelNombre.text = "¡Felicidades, " + CerebroMisiones.nombre_jugador + "!"
	else:
		$LabelNombre.text = "¡Felicidades, Explorador!"
	
	# 3. PONER LA FECHA: (Hoy es 16/04/2026)
	var t = Time.get_date_dict_from_system()
	$LabelFecha.text = "Logrado el: %02d/%02d/%d" % [t.day, t.month, t.year]
	
	# 4. MOSTRAR LA IMAGEN:
	# Busca el archivo "INSIGNIA 1.png" en tu carpeta principal
	var ruta = "res://INSIGNIA " + str(numero_de_insignia) + ".png"
	if FileAccess.file_exists(ruta):
		$TextureRect.texture = load(ruta)
	else:
		print("Error: No encontré la imagen en " + ruta)

# EXTRA: Cerrar la pantalla si el niño hace clic
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		queue_free()
