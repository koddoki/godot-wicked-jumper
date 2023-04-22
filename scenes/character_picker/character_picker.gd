extends Control

@export_enum("player1","player2", "solo") var active_player = "player1"

var skins = ["blue", "orange", "green", "pink", "peach"]
var active_skin


func _ready():
	if active_player == "solo":
		$PlayerRichTextLabel.queue_free()
	elif active_player == "player2":
		skins = ["blue", "green", "orange", "pink", "peach"]
		$PlayerRichTextLabel.text = "[center][wave amp=25 freq=5]Jogador 2"
	update_caroussel_sprites()
	active_skin = skins[2]


func _process(delta):
	change_selected_sprite()


func change_selected_sprite():
	var direction = int(Input.get_axis(active_player+"_left", active_player+"_right"));
	if direction == 0:
		return;
	if direction == 1:
		$AnimationPlayer.play("next_sprite")
		return;
	if direction == -1:
		$AnimationPlayer.play("previous_sprite")
		return


func previous_sprite():
	var last_skin = skins.pop_back()
	skins.insert(0, last_skin)
	$AnimationPlayer.play("RESET")


func next_sprite():
	var first_skin = skins[0]
	skins.remove_at(0)
	skins.push_back(first_skin)
	$AnimationPlayer.play("RESET")


func update_caroussel_sprites():
	$"Carroussel/Character-2".play(skins[0])
	$"Carroussel/Character-1".play(skins[1])
	$"Carroussel/Character0".play(skins[2])
	$"Carroussel/Character1".play(skins[3])
	$"Carroussel/Character2".play(skins[4])
	active_skin = skins[2]
