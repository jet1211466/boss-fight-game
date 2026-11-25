extends CharacterBody2D

const BLADE = preload("res://scenes/blade.tscn")

func _physics_process(delta: float) -> void:
	move_and_slide()
	
func onTimerTimeout() -> void:
	var choice = randi_range(0, 4)
	
	if choice == 0:
		leftBlade()
	elif choice == 1:
		rightBlade()
	elif choice == 2:
		middleBlade()
	elif choice == 3:
		bladeRain()
	elif choice == 4:
		rest()
		
		
func leftBlade():
	var blade = BLADE.instantiate()
	get_tree().current_scene.add_child(blade)
	blade.global_position = global_position + Vector2(-100, 0)
	
func rightBlade():
	var blade = BLADE.instantiate()
	get_tree().current_scene.add_child(blade)
	blade.global_position = global_position + Vector2(100, 0)
	
func middleBlade():
	var blade = BLADE.instantiate()
	get_tree().current_scene.add_child(blade)
	blade.global_position = global_position
	
func bladeRain():
	pass
	
func rest():
	pass
