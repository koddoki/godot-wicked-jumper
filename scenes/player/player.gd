extends CharacterBody2D

const GRAVITY = 20;
const JUMP_FORCE = 10;
const SPEED = 5;

@export_enum("player1","player2") var active_player = "player1"

@onready var green_player = preload("res://scenes/player/animations/green_player.tres")
@onready var blue_player = preload("res://scenes/player/animations/blue_player.tres")


func _ready():
	if active_player == "player1":
		$PlayerAnimatedSprite.sprite_frames = green_player
	else :
		$PlayerAnimatedSprite.sprite_frames = blue_player
	
var direction;
var alive = true



func movement(delta):
	if alive == true:
		velocity.y += GRAVITY * delta;
		direction = int(Input.get_axis(active_player+"_left", active_player+"_right"));
		velocity.x = lerp(int(velocity.x), direction * SPEED, 0.4)
		
		var collision = move_and_collide(velocity);
		if collision:
			velocity.y = -JUMP_FORCE;


func teleport():
	position.x = wrapf(position.x, -5, 485)
	


func animation_state():
	if velocity.y > 0:
		$PlayerAnimatedSprite.play("fall");
		return;
	$PlayerAnimatedSprite.play("jump");


func animation_direction():
	if direction == 1:
		$PlayerAnimatedSprite.flip_h = true;
	if direction == -1:
		$PlayerAnimatedSprite.flip_h = false; 



func _physics_process(delta):
	movement(delta);
	animation_state();
	animation_direction();
	teleport();

func killzone_entered():
	print(active_player+" foi de base!")
	alive = false
#	Isso é placeholder ok


func _on_tree_exited():
	print(active_player+" foi de base!")
