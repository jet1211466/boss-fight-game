extends ProgressBar
@onready var Boss: boss = $"../boss"
@onready var label = $Label
@onready var animationBar = $animationBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_value = Boss.currentHealth
	value = Boss.currentHealth
	animationBar.max_value = Boss.currentHealth
	animationBar.value = Boss.currentHealth
	
	label.text = str(Boss.currentHealth)
	Boss.healthChanged.connect(_on_boss_health_changed)
	
func _on_boss_health_changed():
	label.text = str(Boss.currentHealth)
	value = Boss.currentHealth
	
	var tween = create_tween()
	tween.tween_interval(0.2)
	tween.tween_property(animationBar, "value", Boss.currentHealth, 0.4)
