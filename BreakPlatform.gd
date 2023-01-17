extends KinematicBody2D


var Life = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Life == 0:
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Detect_body_entered(body):
	if body.is_in_group("Player"):
		if body.is_on_floor():
			Life -= 1
		
