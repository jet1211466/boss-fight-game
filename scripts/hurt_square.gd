extends Sprite2D

func flash():
	modulate.a = 0.5
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0, 0.25)
