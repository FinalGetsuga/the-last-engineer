extends CharacterBody3D

@export var speed := 5.0
@export var jump_velocity := 5.0
@export var mouse_sensitivity := 0.002

@onready var flashlight = $Head/Camera3D/Flashlight
@onready var flashlight_sound = $FlashlightSound

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var head = $Head


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)

		head.rotate_x(-event.relative.y * mouse_sensitivity)

		head.rotation.x = clamp(
			head.rotation.x,
			deg_to_rad(-80),
			deg_to_rad(80)
		)
		
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			
	


func _physics_process(delta):

	if Input.is_action_just_pressed("flashlight"):
		flashlight.visible = !flashlight.visible
		flashlight_sound.play()
		
	# Gravity
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	# Movement
	var input = Input.get_vector(
		"move_left",
		"move_right",
		"move_forward",
        "move_backward"
	)

	var direction = (
		transform.basis *
		Vector3(input.x, 0, input.y)
	).normalized()

	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()
