extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Character0000.play("default")
	$Character0001.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
