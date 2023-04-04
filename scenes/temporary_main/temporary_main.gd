extends Node2D

func _ready():
	$AnimationPlayer.play("arrowMovement")

func _process(delta):
		if (Input.is_action_just_pressed("any")):
			get_tree().change_scene_to_file("res://scenes/testing_scene/testing_scene.tscn")

