extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var scene := preload("res://ball.tscn")
	
	# Configuration
	var rows := 30
	var cols := 12
	var spacing := 0.16 # Slightly larger than the ~0.15m ball diameter to prevent overlapping
	var center_position := Vector3(0, 0.1, 0)
	
	# Calculate offsets to ensure the grid is perfectly centered at center_position
	var offset_x := (rows - 1) * spacing / 2.0
	var offset_z := (cols - 1) * spacing / 2.0

	for x in range(rows):
		for z in range(cols):
			var instance = scene.instantiate()
			
			# Calculate local position relative to the grid center
			var local_x := (x * spacing) - offset_x
			var local_z := (z * spacing) - offset_z
			
			instance.position = center_position + Vector3(local_x, 0, local_z)
			add_child(instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
