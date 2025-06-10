extends Node2D

const coordenadas = {
	1:[272,208], 
	2:[512,208], 
	3:[752,208], 
	4:[992,208], 
	5:[1216, 208], 
	6:[272,432],
	7:[512,432],
	8:[752,432],
	9:[992,432],
	10:[1216, 432],
	11:[272,656],
	12:[512,656],
	13:[752,656],
	14:[992,656],
	15:[1216, 656],
	16:[272,880],
	17:[512,880],
	18:[752,880],
	19:[992,880],
	20:[1216, 880]
}

@onready var txt = $Label
@onready var player = $Player
@onready var btn = $Button
var rng = RandomNumberGenerator.new()
var previous_state = 0

func _ready():
	$CanvasLayer.visible = false
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and $Player.look_up:
		for child in get_children():
			if child.scene_file_path == "res://Scenes/sign.tscn" and child.player_entered:
				$Player.speed = 0
				$Player/sign_ui.open()
	if Input.is_action_just_pressed("ui_accept") and $Gatekeeper.player_entered:
		$Player/passcode.open()
		$Player.speed=0
	

func change():
	var test = rng.randi_range(1,20)
	if(test == previous_state):
		print("IGUAL")
		change()
	else:
		print(previous_state)
		previous_state = test
		print(test)
		print(coordenadas[test])
		$Player.position.x = coordenadas[test][0]
		$Player.position.y = coordenadas[test][1]
		$Player/sign_ui.show_enigma(test)
		await get_tree().create_timer(1).timeout
		$Player.visible = true
		$CanvasLayer/ColorRect.fade_to_normal()
		await get_tree().create_timer(1).timeout
		$CanvasLayer.visible = false
		$Player.speed = 50
		for child in get_children():
			if child.scene_file_path == "res://Scenes/door.tscn":
				child.sai = false
				child.get_node("StaticBody2D/Colisor_Porta").position.y = 2.5


func _on_door_change():
	$CanvasLayer.visible = true
	$CanvasLayer/ColorRect.fade_to_black()
	await get_tree().create_timer(1).timeout
	change()


func _on_saida_final():
	$CanvasLayer/ColorRect.fade_to_black()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://Scenes/final.tscn")
