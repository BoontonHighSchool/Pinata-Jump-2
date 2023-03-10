extends KinematicBody2D

export (int) var speed = 600
export (int) var jump_speed = -1500
export (int) var gravity = 4000

var velocity = Vector2.ZERO

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = jump_speed
