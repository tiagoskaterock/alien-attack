extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta):
	# Inicializa a variável de direção como um vetor zero.
	var direction = Vector2.ZERO

	# Captura a entrada do jogador para as direções
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1

	# Normaliza o vetor de direção para evitar movimento mais rápido em diagonais
	if direction != Vector2.ZERO:
		direction = direction.normalized()

	# Define a velocidade com base na direção
	velocity = direction * SPEED

	# Move a nave usando move_and_slide
	move_and_slide()
