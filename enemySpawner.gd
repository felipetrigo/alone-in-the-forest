extends Node3D

@onready var main = get_tree().current_scene
@onready var timer = $Timer
@onready var enemyScene = preload("res://scenes/eye.tscn")
@export var raio_spawn = 8
var all_enemy = []
func spawn():
	var enemy = enemyScene.instantiate()
	all_enemy.append(enemy)
	main.add_child(enemy)
	enemy.position = transform.origin + Vector3(randi_range(-raio_spawn,raio_spawn),
	randi_range(-raio_spawn,raio_spawn),
	randi_range(-raio_spawn,raio_spawn))
	timer.set_wait_time(15.)

func _on_timer_timeout():
	spawn()


func _on_character_dmg():
	for enemy in all_enemy:
		if enemy == null:
			all_enemy.erase(enemy)
		else:
			enemy.take_damage()
