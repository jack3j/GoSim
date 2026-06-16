extends Label

func _process(_delta: float) -> void:
	# Engine.get_frames_per_second() returns the current FPS as a float
	text = "FPS: " + str(Engine.get_frames_per_second())   
