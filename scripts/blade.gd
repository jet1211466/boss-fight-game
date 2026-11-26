extends Area2D

func _ready() -> void:
	$Timer.timeout.connect(onTimerTimeout)

func onTimerTimeout() -> void:
	goDown()

func goDown():
	var tween = create_tween()
	tween.tween_property(self, "position:y", 800, 0.9)

func _process(delta: float) -> void:
	rotate(delta * 10.0)
