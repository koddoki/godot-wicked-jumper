extends Node2D

signal game_start_timer_is_over

var seconds_until_game_start : int

func _on_timer_timeout():
	seconds_until_game_start = seconds_until_game_start - 1
	update_label()
	if seconds_until_game_start == 0:
		print("GameStartTimer is emiting the signal 'game_start_timer_is_over'")
		emit_signal("game_start_timer_is_over")
		$Timer.stop()
		return


func update_label():
	$Labels/TimeLeft.text = "[center][tornado freq=6 radius=4]"+str(seconds_until_game_start)
