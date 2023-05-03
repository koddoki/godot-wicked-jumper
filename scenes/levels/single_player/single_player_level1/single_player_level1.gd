extends Node2D

@onready var player = $SinglePlayerGame/Player
@onready var ui_animated_sprite = $Ui/AnimatedSprite2D
@onready var ui_points = $Ui/Points
@onready var ui_animation_player = $Ui/AnimationPlayer

var points = 0000

var is_match_going = true
var keyboard_locked = true

func set_player_color(player_color: String):
	player.player_skin = player_color


func _ready():
	player.connect("player_died", Callable(self, "foi_de_base"))


func release_keyboard():
	print("Keyboard unlocked at single_player_level1")
	keyboard_locked = false


func foi_de_base(which_player, player_color):
	print (which_player, player_color)
	ui_points.text = "[center][shake rate=3 level=10][tornado freq=5 radius=5]"+str(points)
	ui_animated_sprite.play("victory_" + player_color)
	ui_animation_player.play("game_over")
