extends Control

@onready var fondo = $TextureRect

func _ready():
	# El fondo se queda fijo con la imagen normal
	fondo.texture = preload("res://35.png")
	print("Menú de Selección Listo.")

# --- BOTÓN THEO ---

func _on_theo_button_pressed():
	# 1. Guardamos la elección internamente
	Global.personaje_seleccionado = "Theo"
	print("Theo seleccionado internamente.")
	
	# 2. CAMBIAMOS DE ESCENA (Esto es lo que faltaba)
	get_tree().change_scene_to_file("res://SeleccionNivel.tscn")

# --- BOTÓN JOY ---

func _on_joy_button_pressed():
	# 1. Guardamos la elección internamente
	Global.personaje_seleccionado = "Joy"
	print("Joy seleccionada internamente.")
	
	# 2. CAMBIAMOS DE ESCENA
	get_tree().change_scene_to_file("res://SeleccionNivel.tscn")

# --- FUNCIONES DE MOUSE (VACÍAS PARA QUE NO HAGAN NADA) ---

func _on_theo_button_mouse_entered(): pass
func _on_theo_button_mouse_exited(): pass
func _on_joy_button_mouse_entered(): pass
func _on_joy_button_mouse_exited(): pass
