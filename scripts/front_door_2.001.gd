extends Area3D

@onready var animation_player = $AnimationPlayer

var player_inside := false


func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)


func _on_body_entered(body):
	if body.is_in_group("player"):
		player_inside = true
		open_door()


func _on_body_exited(body):
	if body.is_in_group("player"):
		player_inside = false


func open_door():
	if not animation_player.is_playing():
		animation_player.play("FrontDoor_2_001Action")
