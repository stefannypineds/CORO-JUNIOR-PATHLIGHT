extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var mouse_sensitivity = 0.002

# Según tu foto, la cámara está dentro del modelo
@onready var camera = $"MODELO NIÑA/Camera3D" 
var anim_player: AnimationPlayer

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if camera:
		camera.make_current()
	
	# Buscamos el AnimationPlayer que ya vimos que existe
	anim_player = find_child("AnimationPlayer", true, false)

func _input(event):
	# Rotación de cámara FPS
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		# Girar el cuerpo a los lados (Izquierda/Derecha)
		rotate_y(-event.relative.x * mouse_sensitivity)
		
		# Girar la cámara arriba/abajo
		if camera:
			camera.rotate_x(-event.relative.y * mouse_sensitivity)
			# Ponemos límites para que no se de la vuelta completa la cabeza
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-85), deg_to_rad(85))

func _physics_process(delta):
	# Gravedad
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Salto
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Movimiento basado en hacia dónde mira la cámara
	var input_dir = Input.get_vector("derecha", "izquierda", "adelante", "atras")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		
		# Si se mueve, camina
		if anim_player and anim_player.has_animation("mixamo_com"):
			if anim_player.current_animation != "mixamo_com":
				anim_player.play("mixamo_com")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
		# Si se detiene, se queda estática (como pediste)
		if anim_player:
			anim_player.stop()

	move_and_slide()

# --- TUS PORTALES ---
func _on_portal_hacia_3_body_entered(body):
	if body == self: get_tree().change_scene_to_file("res://MAPA 3.tscn")
func _on_hacia_mapa_4_y_5_body_entered(body):
	if body == self: get_tree().change_scene_to_file("res://MAPA 3 Y 4.tscn")
func _on_portal_hacia_6_body_entered(body):
	if body == self: get_tree().change_scene_to_file("res://MAPA 6.tscn")
func _on_portal_hacia_7_body_entered(body):
	if body == self: get_tree().change_scene_to_file("res://MAPA 7 Y 8.tscn")
func _on_portal_hacia_8_body_entered(body):
	if body == self: get_tree().change_scene_to_file("res://MAPA 8 FINAL.tscn")
