extends Control

@onready var fondo = $TextureRect

# Cargamos las imágenes (asegúrate de que las rutas sean exactas)
var img_normal = preload("res://Imagenes del recorrido.png") # La imagen donde nadie brilla
var img_theo_brilla = preload("res://Imagenes del recorrido (1).png")
var img_joy_brilla = preload("res://Imagenes del recorrido (2).png")

# --- FUNCIONES PARA THEO ---
func _on_theo_button_mouse_entered():
	fondo.texture = img_theo_brilla # Brilla Theo al poner el mouse

func _on_theo_button_mouse_exited():
	fondo.texture = img_normal # Vuelve a la normalidad al quitar el mouse

# --- FUNCIONES PARA JOY ---
func _on_joy_button_mouse_entered():
	fondo.texture = img_joy_brilla # Brilla Joy al poner el mouse

func _on_joy_button_mouse_exited():
	fondo.texture = img_normal # Vuelve a la normalidad al quitar el mouse
