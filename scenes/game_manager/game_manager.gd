extends Node2D

var game_manager = preload("res://scenes/game_manager/game_manager.tscn")
var main_menu = preload("res://scenes/main_menu/main_menu.tscn")
#var solo_level = preload()
var multiplayer_level = preload("res://scenes/testing_scene/testing_scene.tscn")


func _ready():
	instantiate_main_menu()

func instantiate_main_menu():
	var instance = main_menu.instantiate()
	add_child(instance)
	instance.connect("multiplayer_selected", Callable(self, "start_single_player"))
	instance.connect("singleplayer_selected", Callable(self, "start_multi_player"))
	instance.connect("exit",  Callable(self, "close_game"))


func start_single_player():
	pass


func start_multi_player():
	var instance = multiplayer_level.instantiate()
	add_child(instance)


func close_game():
	get_tree().quit()
