extends Node2D

@export var item: InvItem
var player = null 

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pickable_area_body_entered(body):
	if body.name == "Player":
		player = body
		player.collect(item)
		$AudioStreamPlayer2D.play()
		$pickable_area/CollisionShape2D.queue_free()
		visible = false
		
		
