extends Node3D

@onready var camera = $".."
@onready var player = $"../../.."

func _process(delta):
	transform = camera.transform
	var vector = player.position
	vector.z = player.position.z - 1
	position = vector
	
