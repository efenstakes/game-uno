extends KinematicBody2D


var velocity := Vector2.ZERO

export var MAX_SPEED := Vector2(800, 800)
export var V_SPEED : int = 4000
export var H_SPEED : int = 800


 


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Player READY")
	#var energy_candy = get_node("../EnergyCandy/Sprite")
	#energy_candy.connect("got_energy", self, "_on_Player_got_energy")
	#energy_candy.set_process(false)

	
func _physics_process(delta):
	#print("Player _physics_process")
	#velocity.x -= SPEED * delta
	
	#print("Player _physics_process")
	if Input.is_action_pressed("ui_left"):
		velocity.x -= H_SPEED * delta
	if Input.is_action_pressed("ui_right"):
		velocity.x += H_SPEED * delta
		
	# ensure speeed doesnt surpass MAX SPEEd
	velocity.x = clamp(velocity.x, -MAX_SPEED.x, MAX_SPEED.x)
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y -= (V_SPEED * 10) * delta 
	
	
	# check if user if not pressing any x movement keys & stop
	if not Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		# add negative speed on x to get to 0
		if velocity.x < 0:
			velocity.x += H_SPEED * delta
			velocity.x = clamp(velocity.x, -MAX_SPEED.x, 0)
		elif velocity.x > 0:
			velocity.x -= H_SPEED * delta
			velocity.x = clamp(velocity.x, 0, MAX_SPEED.x)
	
	velocity.y += clamp( (V_SPEED * 0.2) * delta, -MAX_SPEED.y, MAX_SPEED.y)
	
	velocity = move_and_slide(velocity, Vector2.UP)




func _on_Player_got_energy(energy: int):
	print("got energy from enery bar ", energy)
