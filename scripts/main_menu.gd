extends Control

@onready var menu_buttons = $MenuButtons
@onready var title = $Title
@onready var sub_title = $"Sub-Title"
@onready var how_to_play_panel = $HowToPlayPanel

func _ready():
	how_to_play_panel.visible = false
	
	$MenuButtons/Play.pressed.connect(_on_play_pressed)
	$MenuButtons/HowToPlay.pressed.connect(_on_how_to_play_pressed)
	$MenuButtons/Exit.pressed.connect(_on_exit_pressed)
	
	$HowToPlayPanel/Back.pressed.connect(_on_back_pressed)
	
func _on_play_pressed():
	GameManager.game_started = true
	get_tree().change_scene_to_file("res://scenes/Main.tscn")
	
func _on_how_to_play_pressed():
	title.visible = false
	sub_title.visible = false
	menu_buttons.visible = false
	how_to_play_panel.visible = true
	
func _on_back_pressed():
	how_to_play_panel.visible = false
	title.visible = true
	sub_title.visible = true
	menu_buttons.visible = true
	
func _on_exit_pressed():
	get_tree().quit()
