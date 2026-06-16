extends RigidBody3D

const MOVE_FORCE = 1000.0
const ROT_TORQUE = 40.0
const JUMP_FORCE = 6.0

func _physics_process(delta):

	# --- ROTATION (still allowed) ---
	var rot_input = 0.0
	if Input.is_action_pressed("RotateCCW"):
		rot_input += 1.0
	if Input.is_action_pressed("RotateCW"):
		rot_input -= 1.0

	if rot_input != 0.0:
		apply_torque(Vector3.UP * rot_input * ROT_TORQUE)

	# --- WORLD-LOCKED MOVEMENT ---
	var move_dir = Vector3.ZERO

	if Input.is_action_pressed("Forward"):
		move_dir.z -= 1   # world -Z
	if Input.is_action_pressed("Backward"):
		move_dir.z += 1   # world +Z
	if Input.is_action_pressed("Left"):
		move_dir.x -= 1   # world -X
	if Input.is_action_pressed("Right"):
		move_dir.x += 1   # world +X

	if move_dir != Vector3.ZERO:
		move_dir = move_dir.normalized()
		apply_central_force(move_dir * MOVE_FORCE)
