extends Node3D

@onready var main = get_tree().current_scene
@onready var timer = $Timer
@onready var enemyScene = preload("res://scenes/eye.tscn")
@export var raio_spawn = 40

func spawn():
	var enemy = enemyScene.instantiate()
	main.add_child(enemy)
	enemy.position = transform.origin + Vector3(randi_range(-raio_spawn,raio_spawn),
	6, #range em Y
	randi_range(-raio_spawn,raio_spawn))
	timer.set_wait_time(2.)

func _on_timer_timeout():
	spawn()

