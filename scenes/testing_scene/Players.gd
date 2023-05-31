extends Node2D

@onready var player1 = $Player1
@onready var player2 = $Player2

func get_leading_player():
	if(player1.position.y < player2.position.y):
		return player1
	return player2
