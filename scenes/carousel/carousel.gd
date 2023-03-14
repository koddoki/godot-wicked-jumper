extends Control

var current_sprite = 0
var sprite_count = 0
var sprite_array = []
var animation_duration = 1.0  # in seconds
var animation_speed = 1.0     # in pixels per second
var animation_timer = 0.0

func _ready():
	sprite_count = $VBoxContainer.get_child_count()
	for i in range(sprite_count):
		sprite_array.append($VBoxContainer.get_child(i))

	animation_timer = animation_duration
	_animate_sprite()

func _animate_sprite():
	sprite_array[current_sprite].position.x = 0
	current_sprite = (current_sprite + 1) % sprite_count
	sprite_array[current_sprite].frame = 0
	sprite_array[current_sprite].position.x = -sprite_array[current_sprite].frame_size.x

	animation_timer = animation_duration
	$Timer.start()

func _process(delta):
	if animation_timer > 0:
		var distance = animation_speed * delta
		sprite_array[current_sprite].position.x += distance
		sprite_array[(current_sprite + 1) % sprite_count].position.x += distance

		animation_timer -= delta
		if animation_timer <= 0:
			_animate_sprite()
