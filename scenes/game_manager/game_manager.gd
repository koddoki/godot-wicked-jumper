extends Node2D

var menu_controller = preload("res://scenes/menu_controller/menu_controller.tscn")
var singleplayer_level = preload("res://scenes/singleplayer_menu/single_player_menu.tscn")
var multiplayer_level = preload("res://scenes/testing_scene/testing_scene.tscn")


func _ready():
	instantiate_main_menu()

func instantiate_main_menu():
	var instance = menu_controller.instantiate()
	add_child(instance)
	instance.connect("start_singleplayer_game", Callable(self, "start_single_player"))
	instance.connect("start_multiplayer_game", Callable(self, "start_multi_player"))
	instance.connect("close_game",  Callable(self, "close_game"))


func start_single_player():
	var instance = singleplayer_level.instantiate()
	add_child(instance)


func start_multi_player():
	var instance = multiplayer_level.instantiate()
	add_child(instance)


func close_game():
	get_tree().quit()
