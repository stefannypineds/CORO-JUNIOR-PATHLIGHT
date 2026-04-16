extends Control

@onready var fondo = $TextureRect

# 1. Definimos qué archivo es cada quién (Rutas de archivos)
const RUTA_THEO = "res://JUGADOR NIÑO.tscn"
const RUTA_JOY = "res://MODELO NIÑA.tscn"

# 2. Imágenes de fondo para el efecto de iluminación
var img_normal = preload("res://Imagenes del recorrido.png")
var img_theo_brilla = preload("res://Imagenes del recorrido (1).png")
var img_joy_brilla = preload("res://Imagenes del recorrido (2).png")

func _ready():
	# Al empezar, el fondo está normal
	fondo.texture = img_normal
	print("Menú de Selección Listo. Global actual: ", Global.personaje_seleccionado)

# --- LÓGICA PARA THEO (EL NIÑO) ---

func _on_theo_button_mouse_entered():
	fondo.texture = img_theo_brilla

func _on_theo_button_mouse_exited():
	fondo.texture = img_normal

func _on_theo_button_pressed():
	Global.personaje_seleccionado = "Theo"
	print("Seleccionaste a THEO (Ruta: ", RUTA_THEO, ")")
	get_tree().change_scene_to_file("res://SeleccionNivel.tscn")

# --- LÓGICA PARA JOY (LA NIÑA) ---

func _on_joy_button_mouse_entered():
	fondo.texture = img_joy_brilla

func _on_joy_button_mouse_exited():
	fondo.texture = img_normal

func _on_joy_button_pressed():
	Global.personaje_seleccionado = "Joy"
	print("Seleccionaste a JOY (Ruta: ", RUTA_JOY, ")")
	get_tree().change_scene_to_file("res://SeleccionNivel.tscn")
