extends Node2D

var player_entered = false
var player = null
var has_key = false

var key: InvItem = preload("res://Inventory/items/gold_key.tres")


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true
	$StaticBody2D/AnimatedSprite2D.play("closed")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and player_entered and has_key:
		open()
	elif Input.is_action_just_pressed("ui_accept") and player_entered and !has_key:
		$locked.play()

func check_key(player, key: InvItem):
	if player.has_node("Inv_UI"):
		var inv_ui = player.get_node("Inv_UI")
		if inv_ui.contains_item(key):
			has_key = true
		else:
			has_key = false
	else:
		print("Player não possui o nó 'inv_ui'")
		has_key = false

func _on_opening_area_body_entered(body):
	if body.name == "Player":
		player = body
		check_key(player, key)
		print(has_key)
		player_entered = true
		
func open():
	$open.play()
	await get_tree().create_timer(0.5).timeout
	$StaticBody2D/AnimatedSprite2D.play("opened")
	await get_tree().create_timer(0.75).timeout
	$pop.play()
	visible = false
	await get_tree().create_timer(0.69).timeout 
	queue_free()
	
	
	


func _on_opening_area_body_exited(body):
	player_entered = false
	player = null
