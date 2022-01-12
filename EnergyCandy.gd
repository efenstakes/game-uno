extends Area2D


signal got_energy(energy)


# Called when the node enters the scene tree for the first time.
func _ready():
	#print("Energy Candy READY")
	pass
	




func _on_EnergyCandy_body_entered(body: KinematicBody2D):
	print("body entered candy --> ", body.name)
	if body.name  == "Player":
		emit_signal("got_energy", 20)
		#body._on_Player_got_energy(20)
		Uno.increase_score(20)
		queue_free()
