extends Node2D

signal close_game
signal start_singleplayer_game(player_color:String)
signal start_multiplayer_game(player1_color:String, player2_color:String)

@onready var main_menu = $MainMenu
@onready var singleplayer_menu = $SinglePlayerMenu
@onready var multiplayer_menu = $MultiplayerMenu
@onready var credits_menu = "batata"


func _ready():
	connect_main_menu_signals()
	connect_singleplayer_menu_signals()
	connect_multiplayer_menu_signals()


func connect_main_menu_signals():
	main_menu.connect("multiplayer_selected", Callable(self, "open_multiplayer_tab"))
	main_menu.connect("singleplayer_selected", Callable(self, "open_singleplayer_tab"))
	main_menu.connect("close_game",  Callable(self, "emit_close_game_signal"))


func connect_singleplayer_menu_signals():
	singleplayer_menu.connect("start_singleplayer_game", Callable(self, "emit_start_singleplayer_game_signal"))
	singleplayer_menu.connect("close_singleplayer_tab", Callable(self, "close_singleplayer_tab"))


func connect_multiplayer_menu_signals():
	multiplayer_menu.connect("start_multiplayer_game", Callable(self, "emit_start_multiplayer_game_signal"))
	multiplayer_menu.connect("close_multiplayer_tab", Callable(self, "close_multiplayer_tab"))


func open_multiplayer_tab():
	$AnimationPlayer.play("fade_in_multiplayer_menu")
	$MultiplayerMenu.is_active = true


func open_singleplayer_tab():
	$AnimationPlayer.play("fade_in_singleplayer_menu")
	$SinglePlayerMenu.is_active = true


func close_singleplayer_tab():
	$AnimationPlayer.play("fade_out_singleplayer_menu")


func close_multiplayer_tab():
	$AnimationPlayer.play("fade_out_multiplayer_menu")


func emit_start_singleplayer_game_signal(player_color:String):
	print("MenuController is emiting the signal 'start_singleplayer_game'")
	emit_signal("start_singleplayer_game", player_color)


func emit_start_multiplayer_game_signal(player1_color:String, player2_color:String):
	print("MenuController is emiting the signal 'close_singleplayer_tab'")
	emit_signal("start_multiplayer_game", player1_color, player2_color)


func emit_close_game_signal():
	print("MenuController is emiting the signal 'close_game")
	emit_signal("close_game")
