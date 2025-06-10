extends Node2D

var player_entered = false
var player = null
var aberta = false
var abre = true
@export var sai = false
signal Final

# Called when the node enters the scene tree for the first time.
func _ready():
	$StaticBody2D/Colisor_Porta.position.y = 2.5
	$StaticBody2D/AnimatedSprite2D.play("closed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_entered:
		if player.look_up:
			aberta = true
			open_door()
			abre = false
	pass
	
func open_door():
	if abre:
		player.speed = 0
		$open.play()
		await get_tree().create_timer(0.5).timeout
		$StaticBody2D/Colisor_Porta.position.y = -22.5
		$StaticBody2D/AnimatedSprite2D.play("opened")
		player.speed = 50
	
func close_door():
	$StaticBody2D/AnimatedSprite2D.play("closed")
	
func _on_change_room_body_entered(body):
	if body.name == "Player":
		player.speed = 0
		sai = true
		player.visible = false
		close_door()
		$close.play()
		emit_signal("Final")
	
		


func _on_player_ganhei():
	open_door()


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		player = body
		print(body)
