extends Node

const RUTA = "user://progreso.cfg" # Archivo real en el celular
var config = ConfigFile.new()

# Datos que vamos a recordar
var nivel_maximo = 1
var ultima_posicion = Vector3.ZERO
var ultimo_mapa = "res://Mapa1.tscn"

func _ready():
	cargar_juego()

func guardar_partida(nivel: int, pos: Vector3, ruta_mapa: String):
	if nivel > nivel_maximo: nivel_maximo = nivel
	ultima_posicion = pos
	ultimo_mapa = ruta_mapa
	
	config.set_value("Progreso", "nivel", nivel_maximo)
	config.set_value("Jugador", "pos", ultima_posicion)
	config.set_value("Mapa", "ruta", ultimo_mapa)
	config.save(RUTA)

func cargar_juego():
	if config.load(RUTA) == OK:
		nivel_maximo = config.get_value("Progreso", "nivel", 1)
		ultima_posicion = config.get_value("Jugador", "pos", Vector3.ZERO)
		ultimo_mapa = config.get_value("Mapa", "ruta", "res://Mapa1.tscn")
