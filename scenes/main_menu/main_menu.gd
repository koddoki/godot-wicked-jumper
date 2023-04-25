extends Control

signal multiplayer_selected
signal singleplayer_selected
signal close_game


func _on_single_player_button_pressed():
	print("MainMenu is emiting the signal 'singleplayer_selected'")
	emit_signal("singleplayer_selected")


func _on_multiplayer_button_pressed():
	print("MainMenu is emiting the signal 'multiplayer_selected'")
	emit_signal("multiplayer_selected")


func _on_exit_button_pressed():
	print("MainMenu is emiting the signal 'close_game'")
	emit_signal("close_game")
