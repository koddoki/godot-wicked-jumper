extends CharacterBody2D

const GRAVITY = 20;
const JUMP_FORCE = 10;
const SPEED = 5;

@export_enum("player1","player2") var active_player = "player1"
@export_enum("blue", "orange", "green", "pink", "peach") var player_skin = "green"

var direction;
var alive = true


func _ready():
	pass


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
		$PlayerAnimatedSprite.play(player_skin+"fall");
		return;
	$PlayerAnimatedSprite.play(player_skin+"jump");


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
