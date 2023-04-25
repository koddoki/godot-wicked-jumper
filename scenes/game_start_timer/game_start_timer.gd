extends Node2D

signal timer_is_over
signal timer_is_running

@export var time_to_start:int = 4

func _ready():
	start_timer()


func start_timer():
	$Timer.start(time_to_start)


func _process(delta):
	$VBoxContainer/TimeLeft.text = "\n[center][tornado freq=6 radius=4]"+str(int($Timer.time_left))


func _input(event):
	if event.is_action_pressed("start_game"):
		$AnimationPlayer.play("queue_free")


func exit():
	queue_free()


func _on_timer_timeout():
	print("time_is_over signal was emited")
	emit_signal("timer_is_over")
