extends Control

@onready var fondo = $TextureRect
@onready var timer_espera = $Timer # Asegúrate de que el nodo se llame Timer

# Cargamos las imágenes (revisa que las rutas en tu carpeta sean estas)
var img_normal = preload("res://Imagenes del recorrido.png")
var img_theo_brilla = preload("res://Imagenes del recorrido (1).png")
var img_joy_brilla = preload("res://Imagenes del recorrido (2).png")

func _ready():
	fondo.texture = img_normal

# --- FUNCIONES DE THEO ---
func _on_theo_button_mouse_entered():
	fondo.texture = img_theo_brilla

func _on_theo_button_mouse_exited():
	fondo.texture = img_normal

func _on_theo_button_pressed():
	Global.personaje_seleccionado = "Theo"
	fondo.texture = img_theo_brilla
	timer_espera.start() # ESTO activa el conteo de tiempo

# --- FUNCIONES DE JOY ---
func _on_joy_button_mouse_entered():
	fondo.texture = img_joy_brilla

func _on_joy_button_mouse_exited():
	fondo.texture = img_normal

func _on_joy_button_pressed():
	Global.personaje_seleccionado = "Joy"
	fondo.texture = img_joy_brilla
	timer_espera.start() # ESTO activa el conteo de tiempo

# --- LA PROGRAMACIÓN QUE TE FALTA ---
func _on_timer_timeout():
	# Esta es la orden que le dice a Godot qué sigue después
	# Asegúrate de que tu escena de niveles se llame exactamente así:
	get_tree().change_scene_to_file("res://SeleccionNivel.tscn")
