extends CharacterBody2D


const BLADE = preload("res://scenes/blade.tscn")


func _ready() -> void:
	$bossAttackTimer.timeout.connect(onTimerTimeout)


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
	var tween = create_tween()
	var spawn_pos = global_position - Vector2(250, 350)
	var blade = BLADE.instantiate()
	var beam = $warningBeam
	var movementTimer = $bossMovementTimer
	

	tween.tween_property(self, "position:x", 826, 0.4)
	movementTimer.start()
	await movementTimer.timeout
	tween = create_tween()
	tween.tween_property(self, "position:x", 576, 0.4)

	get_tree().current_scene.add_child(blade)
	blade.global_position = spawn_pos

	beam.top_level = true
	beam.global_position = spawn_pos
	beam.beamAnimation()
	
func rightBlade():
	print("right blade")
	var tween = create_tween()
	var spawn_pos = global_position + Vector2(250, 0) - Vector2(0, 350)
	var blade = BLADE.instantiate()
	var beam = $warningBeam
	var movementTimer = $bossMovementTimer
	

	tween.tween_property(self, "position:x", 250, 0.4)
	movementTimer.start()
	await movementTimer.timeout
	tween = create_tween()
	tween.tween_property(self, "position:x", 576, 0.4)

	get_tree().current_scene.add_child(blade)
	blade.global_position = spawn_pos

	beam.top_level = true
	beam.global_position = spawn_pos
	beam.beamAnimation()
	
func middleBlade():
	print("middle blade")
	var tween = create_tween()
	var left_or_right = randi_range(0, 1)
	var spawn_pos = global_position - Vector2(0, 350)
	var blade = BLADE.instantiate()
	var beam = $warningBeam
	var movementTimer = $bossMovementTimer

	if left_or_right == 0:
		tween.tween_property(self, "position:x", 250, 0.4)
		movementTimer.start()
		await movementTimer.timeout
		tween = create_tween()
		tween.tween_property(self, "position:x", 576, 0.4)
	elif left_or_right == 1:
		tween.tween_property(self, "position:x", 826, 0.4)
		movementTimer.start()
		await movementTimer.timeout
		tween = create_tween()
		tween.tween_property(self, "position:x", 576, 0.4)
		

	get_tree().current_scene.add_child(blade)
	blade.global_position = spawn_pos

	beam.top_level = true
	beam.global_position = spawn_pos
	beam.beamAnimation()
	
func bladeRain():
	print("blade rain")
	
func rest():
	print("rest")
	if global_position == Vector2(576.0, 184.0):
		pass
	else:
		var tween = create_tween()
		tween.tween_property(self, "position", Vector2(576.0, 184.0), 0.5)
