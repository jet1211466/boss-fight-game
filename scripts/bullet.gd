extends Area2D

const SPEED = 900.0
var direction = Vector2.ZERO

func _process(delta: float) -> void:
	position += direction * SPEED * delta
	


func _on_body_entered(body: Node2D) -> void:
	if body is boss:
		body.hurtFlash()
		queue_free()
