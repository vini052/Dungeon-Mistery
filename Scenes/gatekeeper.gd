extends Node2D

@export var player_entered = false

func _ready():
	pass

func _process(delta):
	pass

func _on_interectable_area_body_entered(body):
	if body.name == "Player":
		player_entered = true

func _on_interectable_area_body_exited(body):
	if body.name == "Player":
		player_entered = false
