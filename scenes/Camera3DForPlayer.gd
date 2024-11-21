extends Camera3D

@onready var player = $"../../.."

func _process(delta):
	position = Vector3(player.position.x,player.position.y + 1.75,player.position.z)
