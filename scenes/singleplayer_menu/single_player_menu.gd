extends Control

var press_any_key_label = preload("res://scenes/press_any_key_label/press_any_key_label.tscn")
var game_start_timer = preload("res://scenes/press_any_key_label/press_any_key_label.tscn")
var is_active = true
var seconds_until_game_start : int


signal start_singleplayer_game(player_color)
signal close_singleplayer_tab


func _ready():
	$GameStartTimer.connect("game_start_timer_is_over", Callable(self, "start_game"))


func _input(event):
	if event.is_action_pressed("start_game") && is_active:
		if ($GameStartTimer/Timer.is_stopped()):
			$GameStartTimer.seconds_until_game_start = 3
			$GameStartTimer.update_label()
			$GameStartTimer/Timer.start()
			$GameStartTimer.visible = true
		else:
			$GameStartTimer/Timer.stop()
			$GameStartTimer.visible = false


func start_game():
	start_singleplayer_game.emit($CharacterPicker.active_skin)


func _on_return_button_pressed():
	print("SinglePlayerMenu is emiting the signal 'close_singleplayer_tab'")
	is_active = false
	emit_signal("close_singleplayer_tab")
