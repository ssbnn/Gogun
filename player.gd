extends CharacterBody2D


const JUMP_VELOCITY = -2000.0
const gravity = 9000
var screensize = get_viewport_rect().size

# Get the gravity from the project settings to be synced with RigidBody nodes.

func _ready():
	pass
	# self.position = Vector2(screensize.x/2, screensize.y/2)

func _physics_process(delta):
	# Add the gravity.
	
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	move_and_slide()
