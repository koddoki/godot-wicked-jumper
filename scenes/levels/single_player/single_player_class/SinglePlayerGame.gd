extends Node2D

@onready var player = $Player
@onready var max_height = $MaxHeight


func update_max_height():
	if player.position.y < max_height.position.y+100:
		max_height.position.y = lerp(max_height.position.y, player.position.y-200, 0.4)


func _process(delta):
	$DynamicCamera2D.position.y =  max_height.position.y
	update_max_height()
	max_height.position.y -= 80*delta
