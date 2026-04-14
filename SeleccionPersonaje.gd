extends Control

@onready var fondo = $TextureRect

# Imágenes de fondo
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
	# 1. Guardamos la elección
	Global.personaje_seleccionado = "Theo"
	# 2. Cambiamos de escena inmediatamente
	get_tree().change_scene_to_file("res://SeleccionNivel.tscn")

# --- FUNCIONES DE JOY ---
func _on_joy_button_mouse_entered():
	fondo.texture = img_joy_brilla

func _on_joy_button_mouse_exited():
	fondo.texture = img_normal

func _on_joy_button_pressed():
	# 1. Guardamos la elección
	Global.personaje_seleccionado = "Joy"
	# 2. Cambiamos de escena inmediatamente
	get_tree().change_scene_to_file("res://SeleccionNivel.tscn")
