extends Node2D

var leading_player

@onready var player1 = $Players/Player1
@onready var player2 = $Players/Player2
@onready var max_height = $MaxHeight


func update_max_height():
	leading_player = $Players.get_leading_player()
	if leading_player.position.y < max_height.position.y+100:
		max_height.position.y = lerp(max_height.position.y, leading_player.position.y-200, 0.4)


func _process(delta):
	$DynamicCamera2D.position.y =  max_height.position.y
	update_max_height()
	max_height.position.y -= 80*delta
	


	
	
