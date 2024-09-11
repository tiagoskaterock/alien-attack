extends CharacterBody2D

class_name Player

@export var speed : float = 500
var lives : int = 3

const SHIP_SIZE_Y : int = 50
const SHIP_SIZE_X : int = 40

func _physics_process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
	handle_movement(delta)	
	

func handle_movement(delta):
	var direction = Vector2.ZERO

	# Captura a entrada do jogador para as direções
	# E limita o movimento pelo tamnho da tela
	if Input.is_action_pressed("up"):
		if position.y > SHIP_SIZE_Y:
			direction.y -= 1
	if Input.is_action_pressed("down"):
		if position.y < DisplayServer.screen_get_size().y - SHIP_SIZE_Y:
			direction.y += 1
	if Input.is_action_pressed("left"):
		if position.x > SHIP_SIZE_X:
			direction.x -= 1
	if Input.is_action_pressed("right"):
		if position.x < DisplayServer.screen_get_size().x - SHIP_SIZE_X:
			direction.x += 1

	# Normaliza o vetor de direção para evitar movimento mais rápido em diagonais
	if direction != Vector2.ZERO:
		direction = direction.normalized()

	velocity = direction * speed
	
	move_and_slide()
	

func shoot() -> void:
	var pre_shoot = preload("res://scenes/rocket.tscn")
	var shoot = pre_shoot.instantiate()
	shoot.position.y = position.y
	shoot.position.x = position.x + SHIP_SIZE_X
	get_parent().add_child(shoot)
		


func die() -> void: 
	get_parent().lose_life()
	death_SFX()
	$TimerToRespawn.start()
	hide_player()
	
	
func hide_player() -> void:
	visible = false
	$CollisionShape2D.call_deferred("set_disabled", true)
	
	
func death_SFX():
	var sfx = preload("res://scenes/death_sfx.tscn").instantiate()
	get_parent().add_child(sfx)
	
	

func _on_timer_to_respawn_timeout():
	respawn()


func respawn() -> void:
	go_back_to_start_position()
	show_player()


func go_back_to_start_position():
	position = get_parent().get_node("PlayerStart").position
	
	
func show_player() -> void:
	visible = true
	$CollisionShape2D.call_deferred("set_disabled", false)
