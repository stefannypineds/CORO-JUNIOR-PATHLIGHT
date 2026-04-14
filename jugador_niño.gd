extends CharacterBody3D

# --- VARIABLES DE MOVIMIENTO ---
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# --- VARIABLES DE CÁMARA ---
var mouse_sensitivity = 0.002

# --- REFERENCIAS A NODOS ---
@onready var camera = $Camera3D
@onready var animation_player: AnimationPlayer = $"Animacion niño/AnimationPlayer"
@onready var modelo = $"Animacion niño"

func _ready():
	# Atrapamos el mouse al inicio para que no se salga de la ventana
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	# 1. CONTROL DE CÁMARA (MOUSE PC)
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		if camera != null:
			rotate_y(-event.relative.x * mouse_sensitivity)
			camera.rotate_x(-event.relative.y * mouse_sensitivity)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-80), deg_to_rad(80))
			
	# 2. CONTROL DE CÁMARA (TÁCTIL CELULAR)
	if event is InputEventScreenDrag:
		# Solo si deslizamos en la mitad derecha de la pantalla
		if event.position.x > get_viewport().size.x / 2:
			rotate_y(-event.relative.x * mouse_sensitivity * 0.5)
			camera.rotate_x(-event.relative.y * mouse_sensitivity * 0.5)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-80), deg_to_rad(80))
			
	# 3. LIBERAR EL MOUSE (TECLA ESCAPE)
	if Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _physics_process(delta):
	# Aplicar gravedad
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Salto
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Obtener dirección de entrada (WASD / Flechas)
	var input_dir = Input.get_vector("derecha", "izquierda", "adelante", "atras")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		
		# Animación de caminar y rotación del modelo
		animation_player.play("walk_com") 
		modelo.rotation_degrees.y = 180 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
		# Animación de estar quieto y rotación de descanso
		animation_player.play("Idle_com_001")
		modelo.rotation_degrees.y = 90 

	move_and_slide()

# --- FUNCIONES DE TELETRANSPORTACIÓN (SEÑALES) ---

# Esta función se activa cuando entras al portal del Mapa 1/2 hacia el Mapa 3
func _on_portal_hacia_3_body_entered(body: Node3D) -> void:
	if body.name == "CharacterBody3D":
		get_tree().change_scene_to_file("res://MAPA 3.tscn")

# Esta función se activa cuando entras al bote (u otro portal) del Mapa 3 hacia el Mapa 3 y 4
func _on_hacia_mapa_4_y_5_body_entered(body: Node3D) -> void:
	if body.name == "CharacterBody3D":
		# Asegúrate de que el nombre del archivo sea exacto
		get_tree().change_scene_to_file("res://MAPA 3 Y 4.tscn")


func _on_portal_hacia_6_body_entered(body: Node3D) -> void:
	if body.name == "CharacterBody3D":
		# ¡Nos vamos al mapa 6!
		get_tree().change_scene_to_file("res://MAPA 6.tscn")


func _on_portal_hacia_7_body_entered(body: Node3D) -> void:
	if body.name == "CharacterBody3D":
		# ¡Nos vamos al mapa 6!
		get_tree().change_scene_to_file("res://MAPA 7 Y 8.tscn")
