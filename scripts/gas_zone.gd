extends Area3D

const NORMAL_DRAIN_RATE = 1.0
const GAS_DRAIN_RATE = 5.0

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		GameManager.oxygen_drain_amount = GAS_DRAIN_RATE
		print("Entered gas zone!")
		
func _on_body_exited(body):
	if body.is_in_group("player"):
		GameManager.oxygen_drain_amount = NORMAL_DRAIN_RATE
		print("Left gas zone!")
