extends Node2D


onready var width: = get_viewport_rect().size.x
onready var height: = get_viewport_rect().size.y
onready var player = $Player
onready var raycast = $Player/RayCast2D
var Platform = preload("res://Platforms.tscn")
onready var threshold: = height * 0.3
var newP
var lastP = null
var platformCount: = 4
var platforms: = []

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	OS.center_window()
	player.global_position.y = threshold
	$Camera2D.position = $StartPosition.position
	player.position = $StartPosition.position
	add_child(player)
	spawn_platform()

func spawn_platform():
	print("spawn")
	for i in platformCount:
		var p = Platform.instance()
		var x = rand_range(-150, 150)
		var y = rand_range(-50, -200)
		p.position = player.position + Vector2(x, y)
		add_child(p)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player.position.x > width:
		player.position.x = 0
	if player.position.x < 0:
		player.position.x = width
	$Camera2D.position = player.position
	
#	if raycast.is_colliding():
#		spawn_platform()
#		raycast.enabled = false
#	if Input.is_action_just_pressed("ui_accept"):
#		raycast.enabled = true
	if player.global_position.y > height:
		get_tree().reload_current_scene()
#	if player.global_position.y < threshold:
#		spawn_platform()




func _on_Top_body_entered(body):
	if body.is_in_group("Player"):
		call_deferred("spawn_platform")
