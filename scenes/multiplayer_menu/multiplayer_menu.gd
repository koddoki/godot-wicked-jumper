extends Control

var press_any_key_label = preload("res://scenes/press_any_key_label/press_any_key_label.tscn")
var game_start_timer = preload("res://scenes/press_any_key_label/press_any_key_label.tscn")
var is_active = false

signal start_multiplayer_game(player1_color:String, player2_color:String)
signal close_multiplayer_tab


func _ready():
	pass


func _input(event):
	if event.is_action_pressed("start_game") && is_active:
		start_multiplayer_game.emit($CharacterPickers/CharacterPicker1.active_skin, $CharacterPickers/CharacterPicker2.active_skin)
		print("inputou start_game")


func spawn_game_start_timer():
	var instance = game_start_timer.instantiate()
	$BottomTextSpawn.add_child(instance)


func _on_return_button_pressed():
	print("SinglePlayerMenu is emiting the signal 'close_multiplayer_tab'")
	is_active = false
	emit_signal("close_multiplayer_tab")
