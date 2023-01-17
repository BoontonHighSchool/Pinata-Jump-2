extends Node2D


export(Array, PackedScene) var scenes
signal newPlatform

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	
	var platform = scenes[randi() % scenes.size()]
	var instance = platform.instance()
	add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VisibilityNotifier2D_screen_exited():
	print("newPlatform")
	emit_signal("newPlatform")
