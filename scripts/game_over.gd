extends Control

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Buttons/TryAgain.pressed.connect(_on_try_again_pressed)
	$Buttons/MainMenu.pressed.connect(_on_main_menu_pressed)
	
func _on_try_again_pressed():
	GameManager.reset_game()
	GameManager.game_started = true
	
	get_tree().change_scene_to_file("res://scenes/Main.tscn")
	
func _on_main_menu_pressed():
	GameManager.reset_game()
	GameManager.game_started = false
	
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")	
