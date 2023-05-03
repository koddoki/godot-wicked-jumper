extends Node2D

@onready var player = $SinglePlayerGame/Player
@onready var ui_animated_sprite = $Ui/AnimatedSprite2D
@onready var ui_jogador_vencedor = $Ui/JogadorVencedor
@onready var ui_animation_player = $Ui/AnimationPlayer

var is_match_going = true
var keyboard_locked = true

func set_player_color(player_color: String):
	player.player_skin = player_color
