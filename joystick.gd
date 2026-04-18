extends TextureRect

@onready var punta = $Punta
var presionado = false
var radio_maximo = 50.0 # Cambia este número para hacer el tope más grande o chico
var centro_base = Vector2.ZERO

func _ready() -> void:
	# Centramos la bolita al iniciar
	centro_base = size / 2.0
	punta.position = centro_base - (punta.size / 2.0)

func _input(event: InputEvent) -> void:
	# 1. Cuando tocamos la pantalla
	if event is InputEventScreenTouch:
		if event.pressed and get_global_rect().has_point(event.position):
			presionado = true
		elif not event.pressed:
			presionado = false
			# Soltamos el joystick y vuelve al centro
			punta.position = centro_base - (punta.size / 2.0)
			# Soltamos todas las acciones virtuales
			Input.action_release("derecha")
			Input.action_release("izquierda")
			Input.action_release("atras")
			Input.action_release("adelante")

	# 2. Cuando arrastramos el dedo
	if event is InputEventScreenDrag and presionado:
		var desplazamiento = event.position - global_position - centro_base
		
		# Evitamos que la bolita se salga de la base
		if desplazamiento.length() > radio_maximo:
			desplazamiento = desplazamiento.normalized() * radio_maximo
		
		punta.position = centro_base + desplazamiento - (punta.size / 2.0)
		
		# 3. Simulamos tus acciones personalizadas (LOGICA INVERTIDA)
		var direccion = desplazamiento / radio_maximo
		
		# Eje Horizontal (INVERTIDO: Derecha / Izquierda)
		if direccion.x > 0.3:
			# Si la bolita va a la derecha, presionamos "izquierda"
			Input.action_press("izquierda") 
			Input.action_release("derecha")
		elif direccion.x < -0.3:
			# Si la bolita va a la izquierda, presionamos "derecha"
			Input.action_press("derecha")
			Input.action_release("izquierda")
		else:
			Input.action_release("derecha")
			Input.action_release("izquierda")
			
		# Eje Vertical (Abajo / Arriba)
		if direccion.y > 0.3:
			Input.action_press("atras")
			Input.action_release("adelante")
		elif direccion.y < -0.3:
			Input.action_press("adelante")
			Input.action_release("atras")
		else:
			Input.action_release("atras")
			Input.action_release("adelante")
