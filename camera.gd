extends Node3D

@export var target: Node3D
@export var offset : Vector3
@export var follow_speed := 10.0

func _process(delta):
	if target == null:
		return

	global_position = target.global_position + offset
