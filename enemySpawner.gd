extends Node3D

@onready var main = get_tree().current_scene
@onready var timer = $Timer
@onready var enemyScene = preload("res://scenes/eye.tscn")
@export var raio_spawn = 40
@onready var wave = $wave
var time = 0.9
func spawn(time):
	var enemy = enemyScene.instantiate()
	main.add_child(enemy)
	enemy.position = transform.origin + Vector3(randi_range(-raio_spawn,raio_spawn),
	6, #range em Y
	randi_range(-raio_spawn,raio_spawn))
	timer.set_wait_time(time)

func _on_timer_timeout():
	spawn(timer.wait_time)


func _on_wave_timeout():
	timer.wait_time = timer.wait_time * time
