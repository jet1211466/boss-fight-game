extends CharacterBody2D


const SPEED = 300.0
@onready var boss = $"../boss"
var bullet = preload("res://scenes/bullet.tscn")

func _physics_process(_delta: float) -> void:
	processMovement()
	move_and_slide()
	
	if Input.is_action_just_pressed("shoot"):
		shootBullet()


func processMovement() -> void:
	var direction := Input.get_vector("left", "right", "up","down")
	
	velocity = direction * SPEED
	

func shootBullet():
	var newBullet = bullet.instantiate()
	newBullet.global_position = global_position
	newBullet.direction = global_position.direction_to(boss.global_position)
	get_tree().current_scene.add_child(newBullet)
