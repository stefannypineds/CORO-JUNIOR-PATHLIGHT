extends CharacterBody3D

# --- CONFIGURACIÓN DE MOVIMIENTO ---
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var mouse_sensitivity = 0.002

# --- REFERENCIAS DIRECTAS (SIN INSTANCIAR COPIAS) ---
@onready var camera = find_child("Camera3D", true, false)
@onready var anim_player = find_child("AnimationPlayer", true, false)

func _ready():
	# Bloqueamos el mouse para girar la cabeza como un FPS real
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	if camera:
		camera.make_current()
		print("¡Cámara FPS de Joy lista!")
	
	if anim_player:
		print("¡Cerebro de animación de Joy conectado!")

func _input(event):
	# Rotación de cámara FPS
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		# Girar el cuerpo (Izquierda/Derecha)
		rotate_y(-event.relative.x * mouse_sensitivity)
		
		# Girar la cabeza/cámara (Arriba/Abajo)
		if camera:
			camera.rotate_x(-event.relative.y * mouse_sensitivity)
			# Límite para no dar la vuelta completa con la cabeza
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-85), deg_to_rad(85))

func _physics_process(delta):
	# Aplicar gravedad
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Saltar con Espacio
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Obtener dirección (WASD)
	var input_dir = Input.get_vector("derecha", "izquierda", "adelante", "atras")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		
		# Solo camina cuando tú te mueves
		if anim_player and anim_player.has_animation("mixamo_com"):
			if anim_player.current_animation != "mixamo_com":
				anim_player.play("mixamo_com")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
		# Se queda quieta como estatua al soltar las teclas
		if anim_player:
			anim_player.stop()

	move_and_slide()

# --- TUS PORTALES ---
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
