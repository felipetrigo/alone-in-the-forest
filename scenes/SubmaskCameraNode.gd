extends Camera3D

@onready var camera = $"../../../Camera3D"

func _process(delta):
	transform = camera.transform
