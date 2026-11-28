extends ProgressBar
@onready var player = $"../player"
@onready var animationBar = $animationBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_value = player.currentHealth
	value = player.currentHealth
	animationBar.max_value = player.currentHealth
	animationBar.value = player.currentHealth
	
	player.healthChanged.connect(_on_player_health_changed)
	
func _on_player_health_changed():
	value = player.currentHealth
	
	var tween = create_tween()
	tween.tween_interval(0.2)
	tween.tween_property(animationBar, "value", player.currentHealth, 0.4)
