extends Control

var press_any_key_label = preload("res://scenes/press_any_key_label/press_any_key_label.tscn")
var game_start_timer = preload("res://scenes/press_any_key_label/press_any_key_label.tscn")
var is_active = false

signal start_singleplayer_game(player_color)
signal close_singleplayer_tab


func _ready():
	pass

func _input(event):
	if event.is_action_pressed("start_game") && is_active:
		print("inputou start_game")


func spawn_game_start_timer():
	var instance = game_start_timer.instantiate()
	$BottomTextSpawn.add_child(instance)


func _on_return_button_pressed():
	print("SinglePlayerMenu is emiting the signal 'close_singleplayer_tab'")
	is_active = false
	emit_signal("close_singleplayer_tab")
