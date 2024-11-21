extends CharacterBody3D


var SPEED = 5.0
const JUMP_VELOCITY = 4.5
@export var MOUSE_SPEED = 0.02
@export var CONTROLLER_SPEED = 0.08
const SMOOTHING_FACTOR = 0.08
var input_dir = Vector2()
var target_neck_rotation = 0.0
var target_cam_rotation = 0.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var neck := $neck
@onready var cam := $neck/Camera3D
@onready var head_animation := $neck/Camera3D/AnimationPlayer

signal dmg
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _unhandled_input(event):
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventJoypadMotion:
			if event.axis == JoyAxis.JOY_AXIS_RIGHT_X:
				target_neck_rotation += -event.axis_value * CONTROLLER_SPEED
			if event.axis == JoyAxis.JOY_AXIS_RIGHT_Y:
				target_cam_rotation += -event.axis_value * CONTROLLER_SPEED
				target_cam_rotation = clamp(target_cam_rotation, deg_to_rad(-55), deg_to_rad(60))
			neck.rotation.y = lerp(neck.rotation.y, target_neck_rotation, SMOOTHING_FACTOR)
			cam.rotation.x = lerp(cam.rotation.x, target_cam_rotation, SMOOTHING_FACTOR)
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * MOUSE_SPEED)
			cam.rotate_x(-event.relative.y * MOUSE_SPEED)
			cam.rotation.x = clamp(cam.rotation.x,deg_to_rad(-55),deg_to_rad(60))

func _physics_process(delta):
	if Input.is_action_just_pressed("damage"):
		emit_signal("dmg")
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_pressed("sprint") && SPEED < 7.5:
		SPEED *= 1.25;
		head_animation.play("head_bob",-1,2);
	elif SPEED > 5 :
		SPEED *= 0.75;
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	input_dir = Input.get_vector("left_walk", "right_walk", "front_walk", "backout_walk")
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	if input_dir != Vector2():
		head_animation.play("head_bob");
	move_and_slide()
