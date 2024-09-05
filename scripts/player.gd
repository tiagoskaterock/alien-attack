extends CharacterBody2D

const SPEED : float = 300.0
const SHIP_SIZE_Y : int = 50
const SHIP_SIZE_X : int = 40

func _physics_process(delta):
	handle_movement(delta)
	

func handle_movement(delta):
	var direction = Vector2.ZERO

	# Captura a entrada do jogador para as direções
	# E limita o movimento pelo tamnho da tela
	if Input.is_action_pressed("ui_up"):
		if position.y > SHIP_SIZE_Y:
			direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		if position.y < DisplayServer.screen_get_size().y - SHIP_SIZE_Y:
			direction.y += 1
	if Input.is_action_pressed("ui_left"):
		if position.x > SHIP_SIZE_X:
			direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		if position.x < DisplayServer.screen_get_size().x - SHIP_SIZE_X:
			direction.x += 1

	# Normaliza o vetor de direção para evitar movimento mais rápido em diagonais
	if direction != Vector2.ZERO:
		direction = direction.normalized()

	velocity = direction * SPEED
	
	move_and_slide()
	
