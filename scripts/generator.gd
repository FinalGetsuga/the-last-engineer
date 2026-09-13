extends Area3D

var player_in_range := false

@onready var prompt = get_tree().current_scene.get_node("HUD/GeneratorPromt")
@onready var message = get_tree().current_scene.get_node("HUD/GeneratorMessage")


func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		player_in_range = true
		prompt.visible = true

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_in_range = false
		prompt.visible = false

func _process(_delta):
	if player_in_range and Input.is_action_just_pressed("interact"):
		activate_generator()

func activate_generator():
	if GameManager.power_cores >= 7 \
	and GameManager.power_tools >= 3 \
	and GameManager.power_parts >= 10:
		
		GameManager.game_started = false
		prompt.visible = false
		show_victory_screen()
	else:
		show_missing_components()
		
func show_victory_screen():
	get_tree().change_scene_to_file("res://scenes/Victory.tscn")	
	
func show_missing_components():
	message.visible = true
	
	await get_tree().create_timer(3.0).timeout
	
	if is_instance_valid(message):
		message.visible = false	
