extends Node

var game_started := false

var power_cores: int = 0
var power_tools: int = 0
var power_parts: int = 0

var oxygen: float = 100.0
var oxygen_drain_amount: float = 1.0
var oxygen_drain_interval: float = 2.0
var oxygen_timer: float = 0.0

func _process(delta):
	if not game_started:
		return
	
	oxygen_timer += delta
	
	if oxygen_timer >= oxygen_drain_interval:
		oxygen_timer = 0.0
		oxygen -= oxygen_drain_amount
		oxygen = max(oxygen, 0.0)
		
		if oxygen <= 0:
			oxygen_depleted()

func collect_power_core():
	power_cores += 1
	print("Power Cores: ", power_cores)
	
func collect_power_tool():
	power_tools += 1
	print("Power Tools: ", power_tools)
	
func collect_power_part():
	power_parts += 1
	print("Power Parts: ", power_parts)
	
func oxygen_depleted():
	game_started = false
	get_tree().change_scene_to_file("res://scenes/GameOver.tscn")

func reset_game():
	oxygen = 100.0
	oxygen_timer = 0.0
	
	power_cores = 0
	power_tools = 0
	power_parts = 0		
