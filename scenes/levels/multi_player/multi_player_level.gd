extends Node2D

@onready var player1 = $Game/Players/Player1
@onready var player2 = $Game/Players/Player2
@onready var ui_animated_sprite = $Ui/AnimatedSprite2D
@onready var ui_jogador_vencedor = $Ui/JogadorVencedor
@onready var ui_animation_player = $Ui/AnimationPlayer

var is_match_going = true
var keyboard_locked = true

func set_player_color(player1_color: String, player2_color: String):
	print(player1_color, player2_color)
	player1.player_skin = player1_color
	player2.player_skin = player2_color


func _process(_delta):
	if player1.alive == false && is_match_going:
		is_match_going = false
		foi_de_base(player1.active_player)
	if player2.alive == false && is_match_going:
		is_match_going = false
		foi_de_base(player2.active_player)
	if (not keyboard_locked && Input.is_action_just_pressed("start_game")):
		get_tree().change_scene_to_file("res://scenes/temporary_main/temporary_main.tscn")

func foi_de_base(which_player):
	print (which_player)
	if which_player == "player1":
		ui_jogador_vencedor.text = "[center][shake rate=3 level=10][tornado freq=5 radius=5]Jogador 2\nvenceu!"
		ui_animated_sprite.play(player2.player_skin)
	else:
		ui_jogador_vencedor.text = "[center][shake rate=3 level=10][tornado freq=5 radius=5]Jogador 1\nvenceu!"
		ui_animated_sprite.play(player1.player_skin)
	ui_animation_player.play("game_over")

func release_keyboard():
	print("teclado liberado")
	keyboard_locked = false
