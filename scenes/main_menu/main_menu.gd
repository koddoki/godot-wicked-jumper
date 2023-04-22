extends Control

signal multiplayer_selected
signal singleplayer_selected
signal exit


func _ready():
	pass


func _process(delta):
	pass


func _on_single_player_button_pressed():
	print("clicou")
	emit_signal("singleplayer_selected")


func _on_multiplayer_button_pressed():
	print("clicou")
	emit_signal("multiplayer_selected")


func _on_exit_button_pressed():
	print("clicou")
	emit_signal("exit")
