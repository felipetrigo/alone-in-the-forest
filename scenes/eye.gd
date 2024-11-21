extends CharacterBody3D

@export var speed = 5
@export var accel = 10
@onready var agent = $NavigationAgent3D
@onready var mark = get_parent().get_tree().get_root().get_node("world/character/target")

signal hp_change
signal dead

var hp = 5 : set = set_hp
var dmg = 1 

func take_damage():
	set_hp(hp-dmg)

func set_hp(new_hp):
	emit_signal("hp_change",new_hp)
	hp = new_hp
	if hp <= 0:
		die()

func die():
	emit_signal("dead")
	queue_free()

func _physics_process(delta):
	var direction = Vector3()
	agent.target_position = mark.global_position
	direction = agent.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction*speed,accel*delta)
	move_and_slide()
