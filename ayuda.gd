extends Control

# Aquí el código ya sabe dónde están tus fotos en el estante
var fotos = [
	preload("res://40.png"), # Foto 1 (Página 0)
	preload("res://41.png"), # Foto 2 (Página 1)
	preload("res://42.png"), # Foto 3 (Página 2)
	preload("res://43.png"), # Foto 4 (Página 3)
	preload("res://44.png"), # Foto 5 (Página 4)
	preload("res://45.png")  # Foto 6 (Página 5)
]

var pagina_actual = 0 # El número de la página que estamos viendo

@onready var nota_visual = $NotaGrande # Tu cuadro de imagen

func _ready():
	nota_visual.hide() # Que no se vea al empezar

# --- CUANDO TOCAS EL PAPELITO 1 ---
func _on_button_1_pressed():
	pagina_actual = 1 # Le decimos: "Es la primera foto"
	cambiar_foto()
func _on_flecha_pressed():
	if pagina_actual < 5: 
		# Todavía hay notas: pasamos a la siguiente
		pagina_actual += 1 
		cambiar_foto()
	else:
		# ¡YA NO HAY MÁS NOTAS! (Llegamos a la 45)
		# En lugar de solo esconderse, nos manda al menú
		get_tree().change_scene_to_file("res://Menu_de_juego.tscn")

func cambiar_foto():
	nota_visual.texture = fotos[pagina_actual] # Ponemos la foto que toca
	nota_visual.show() # Mostramos el cuadro
