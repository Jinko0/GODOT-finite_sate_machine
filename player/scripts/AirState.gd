extends State
class_name AirState

@export var ground_state : State
@export var double_jump_velocity : float = -300.0

var double_jump_ready = true

func state_process(delta):
	if(character.is_on_floor()):
		next_state = ground_state
	
	if(character.velocity.y > 0):
		playback.travel("jump_end")


func state_input(event : InputEvent):
	if(event.is_action_pressed("jump") && double_jump_ready):
		playback.travel("jump_start")
		double_jump()

func on_exit():
	if(next_state == ground_state):
		double_jump_ready = true
		playback.travel("Start")

func double_jump():
	character.velocity.y = double_jump_velocity
	double_jump_ready = false
