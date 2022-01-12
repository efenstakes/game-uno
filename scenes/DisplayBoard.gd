extends Control




onready var score_label = get_node("Score")


# Called when the node enters the scene tree for the first time.
func _ready():
	Uno.connect("score_changed", self, "_on_Uno_score_changed")


func _on_Uno_score_changed(new_score: int):
	print("_on_Uno_score_changed ", new_score)
	score_label.text = str(new_score)
