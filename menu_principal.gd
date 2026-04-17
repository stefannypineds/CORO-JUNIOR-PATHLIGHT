extends Control
class_name MenuPrincipal # Definimos la clase de este gran paquete

# ==========================================
# 1. ATRIBUTOS DE LA CLASE (Constantes)
# ==========================================
const RUTA_PERSONAJE = "res://SeleccionPersonaje.tscn"
const RUTA_NIVELES = "res://SeleccionNivel.tscn"
const RUTA_AYUDA = "res://Ayuda.tscn"
const RUTA_CREDITOS = "res://Creditos.tscn"

# ==========================================
# 2. MÉTODOS DE LOS BOTONES
# ==========================================

func _on_nueva_partida_pressed() -> void:
	print("Preparando Nueva Partida...")
	
	# Magia OOP: Nos comunicamos con la clase GuardadoManager para limpiar el progreso
	GuardadoManager.nivel_maximo = 1
	GuardadoManager.ultima_posicion = Vector3.ZERO
	GuardadoManager.ultimo_mapa = "res://MAPA 1 Y 2.tscn"
	GuardadoManager.guardar_partida(1, Vector3.ZERO, "res://MAPA 1 Y 2.tscn")
	
	# Viajamos usando nuestra constante
	get_tree().change_scene_to_file(RUTA_PERSONAJE)

func _on_reanudar_partida_pressed() -> void:
	print("Reanudando juego... Viajando a selección de niveles.")
	get_tree().change_scene_to_file(RUTA_NIVELES)

func _on_ayuda_pressed() -> void:
	print("Abriendo panel de Ayuda.")
	get_tree().change_scene_to_file(RUTA_AYUDA)

func _on_creditos_pressed() -> void:
	print("Abriendo Créditos.")
	get_tree().change_scene_to_file(RUTA_CREDITOS)
	
	
