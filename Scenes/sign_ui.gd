extends Control

signal sign_closed
var is_open = false

@export var enigmas = {
	1:"Onde aconteceu a primeira Olimpíada",
	2:"A maior virtude",
	3:"No aniversário, na conquista, na vitória",
	4:preload("res://Enigmas/4.png"),
	5:"É acompanhado de bens",
	6:"Dó _ Mi Fá _ Lá Si",
	7:"A Deusa da _",
	8:preload("res://Enigmas/8.png"),
	9: "(1,7)",
	10:"(3,5)",
	11:"9 33 68",
	12:"(6,17)	(4,15)",
	13:"(2,18)",
	14:preload("res://Enigmas/14.png"),
	15:preload("res://Enigmas/15.png"),
	16:"(11,20)",
	17:"O cego não pode",
	18:"_ 3:7 - 'Ah! Que solitária seja aquela noite e suave música não entre nela!'",
	19:"(8,14)",
	20:preload("res://Enigmas/20.png")
}
# Called when the node enters the scene tree for the first time.
func _ready():
	close()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func open():
	is_open = true
	visible = true

func close():
	is_open = false
	visible = false

func _on_texture_button_pressed():
	close()
	emit_signal("sign_closed")
	
func show_enigma(number):
	$number.text = str(number) + "."
	if typeof(enigmas[number]) == TYPE_STRING:
		$text.text = enigmas[number]
		$text.visible = true
		$Sprite2D.visible = false
	else:
		$Sprite2D.texture = enigmas[number]
		$text.visible = false
		$Sprite2D.visible = true
