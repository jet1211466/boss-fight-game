extends CharacterBody2D


const BLADE = preload("res://scenes/blade.tscn")


func _ready() -> void:
	$Timer.timeout.connect(onTimerTimeout)


func _physics_process(_delta: float) -> void:
	move_and_slide()


func onTimerTimeout() -> void:
	print("timer fired")
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
	print("left blade")
	var blade = BLADE.instantiate()
	get_tree().current_scene.add_child(blade)
	blade.global_position = global_position + Vector2(250, 0)
	
func rightBlade():
	print("right blade")
	var blade = BLADE.instantiate()
	get_tree().current_scene.add_child(blade)
	blade.global_position = global_position + Vector2(900, 0)
	
func middleBlade():
	print("middle blade")
	var blade = BLADE.instantiate()
	get_tree().current_scene.add_child(blade)
	blade.global_position = global_position
	
func bladeRain():
	print("blade rain")
	
func rest():
	print("rest")
	if global_position == Vector2(576.0, 184.0):
		pass
	else:
		var tween = create_tween()
		tween.tween_property(self, "position", Vector2(576.0, 184.0), 1)
