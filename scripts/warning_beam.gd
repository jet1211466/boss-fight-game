extends Sprite2D


func _ready() -> void:
	visible = false
	
func beamAnimation():
	visible = true
	modulate.a = 1.0
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0, 0.8)
	tween.tween_callback(hide)
