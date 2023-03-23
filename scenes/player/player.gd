extends CharacterBody2D

const GRAVITY = 5;
const JUMP_FORCE = 350;
const SPEED = 150;

@export_enum("player1","player2") var active_player = "player1"


var direction;

func movement(delta):
	var collision = move_and_slide();
	
	direction = int(Input.get_axis(active_player+"_left", active_player+"_right"));
	velocity.x = lerp(int(velocity.x), direction * SPEED, 0.4)
	
	velocity.y += GRAVITY;
	
	if collision and is_on_floor():
		velocity.y = -JUMP_FORCE;
	if is_on_ceiling():
		velocity.y = 0


func teleport():
	position.x = wrapf(position.x, 32, 1100)
	


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
	#teleport();
