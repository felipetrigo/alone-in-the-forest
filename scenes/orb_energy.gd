extends Node3D

const SPEED = .75

@onready var mesh = $energyOrb
@onready var cast = $RayCast3D
@onready var particle = $GPUParticles3D

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.basis * Vector3(0, 0, -SPEED)
	if cast.is_colliding():
		mesh.visible = false
		particle.emitting = true
		if cast.get_collider().is_in_group("enemy"):
			cast.get_collider().hit()
		await get_tree().create_timer(1.).timeout
		queue_free()


func _on_timer_timeout():
	queue_free()
