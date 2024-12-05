extends Area3D

@export var damage = 1

signal damage_player(dam)
@onready var selfcoll := $"."


func hit():
	emit_signal("damage_player",damage)


func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("player") :
			hit()
