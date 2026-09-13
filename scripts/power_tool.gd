extends Area3D

@onready var collect_sound = $CollectSound

# Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("player"):
		GameManager.collect_power_tool()
		
		collect_sound.play()
		
		await collect_sound.finished
		
		queue_free()
