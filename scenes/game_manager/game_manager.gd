extends Node2D

var menu_controller = preload("res://scenes/menu_controller/menu_controller.tscn")
var singleplayer_level = preload("res://scenes/levels/single_player/single_player_level1/single_player_level1.tscn")
var multiplayer_level = preload("res://scenes/testing_scene/testing_scene.tscn")


func _ready():
	instantiate_main_menu()


func clean_children_nodes():
	if get_child_count() > 0:
		for child in get_children():
			child.queue_free()


func instantiate_main_menu():
	clean_children_nodes()
	var instance = menu_controller.instantiate()
	add_child(instance)
	instance.connect("start_singleplayer_game", Callable(self, "start_single_player"))
	instance.connect("start_multiplayer_game", Callable(self, "start_multi_player"))
	instance.connect("close_game",  Callable(self, "close_game"))


func start_single_player(player_color:String):
	print(player_color)
	clean_children_nodes()
	var instance = singleplayer_level.instantiate()
	add_child(instance)
	instance.set_player_color(player_color)
	


func start_multi_player():
	clean_children_nodes()
	var instance = multiplayer_level.instantiate()
	add_child(instance)


func close_game():
	get_tree().quit()
