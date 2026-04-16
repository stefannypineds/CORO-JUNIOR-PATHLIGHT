extends CharacterBody3D

# --- CONFIGURACIÓN DE MOVIMIENTO ---
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var mouse_sensitivity = 0.002

# --- REFERENCIAS A NODOS (USANDO BUSCADOR SEGURO) ---
@onready var camera = find_child("Camera3D", true, false)
@onready var animation_player = find_child("AnimationPlayer", true, false)

func _ready():
	# 1. Atrapamos el ratón para poder girar la cámara
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	# 2. Si este personaje es el que está activo, su cámara manda
	if is_visible_in_tree() and camera:
		camera.make_current()
	
	print("Script de Joy iniciado correctamente.")

func _input(event):
	# Control de cámara con el mouse
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		if camera:
			rotate_y(-event.relative.x * mouse_sensitivity)
			camera.rotate_x(-event.relative.y * mouse_sensitivity)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-80), deg_to_rad(80))

func _physics_process(delta):
	# Aplicar gravedad si no está en el suelo
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Control de salto
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Obtener dirección de movimiento (WASD / Flechas)
	var input_dir = Input.get_vector("derecha", "izquierda", "adelante", "atras")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		# Reproducir animación de caminar
		if animation_player and animation_player.has_animation("walk_com"):
			animation_player.play("walk_com")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		# Reproducir animación quieta
		if animation_player and animation_player.has_animation("Idle_com_001"):
			animation_player.play("Idle_com_001")

	move_and_slide()

# --- SISTEMA DE PORTALES (TODOS LOS MAPAS) ---
# Estas funciones se activan cuando Joy entra en un Area3D de portal

func _on_portal_hacia_3_body_entered(body):
	if body == self:
		get_tree().change_scene_to_file("res://MAPA 3.tscn")

func _on_hacia_mapa_4_y_5_body_entered(body):
	if body == self:
		get_tree().change_scene_to_file("res://MAPA 3 Y 4.tscn")

func _on_portal_hacia_6_body_entered(body):
	if body == self:
		get_tree().change_scene_to_file("res://MAPA 6.tscn")

func _on_portal_hacia_7_body_entered(body):
	if body == self:
		get_tree().change_scene_to_file("res://MAPA 7 Y 8.tscn")

func _on_portal_hacia_8_body_entered(body):
	if body == self:
		get_tree().change_scene_to_file("res://MAPA 8 FINAL.tscn")

# --- LIMPIEZA DE ADVERTENCIAS ---
# Si usas señales de entrada de mouse, esto evita los errores amarillos
func _on_input_event(_camera, _event, _event_position, _normal, _shape_idx):
	pass
