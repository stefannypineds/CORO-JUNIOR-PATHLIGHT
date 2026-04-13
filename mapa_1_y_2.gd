extends Node3D

# Usa rutas sencillas. Si están justo debajo del nodo principal, déjalos así:
@onready var theo = $Theo 
@onready var joy = $Joy

func _ready():
	# Primero verificamos si los nodos existen para que no de error
	if theo == null or joy == null:
		print("ERROR: No encontré a Theo o Joy en los nodos. Revisa los nombres.")
		return

	# Ahora leemos el Global
	if Global.personaje_seleccionado == "Theo":
		theo.show()
		joy.hide()
		print("Iniciando Nivel 1 con Theo")
	elif Global.personaje_seleccionado == "Joy":
		joy.show()
		theo.hide()
		print("Iniciando Nivel 1 con Joy")
	else:
		# Por si pruebas el nivel solo, que no se rompa
		theo.show()
		joy.hide()
		print("No se seleccionó nadie, cargando Theo por defecto")
		
