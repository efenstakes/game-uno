extends Node2D



signal score_changed(new_score)


var score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Mian READY")
	reset_score()
	
	

func reset_score():
	score = 0
	emit_signal("score_changed", score)

func increase_score(amount: int):
	score += amount
	emit_signal("score_changed", score)
	

