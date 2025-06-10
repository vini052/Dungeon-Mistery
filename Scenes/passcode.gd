extends Control

var is_open
signal passcode_closed
signal senha_correta

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
	emit_signal("passcode_closed")

func _on_submit_pressed():
	var resposta: String = $LineEdit.text
	resposta = resposta.to_lower()
	resposta = TextServerManager.get_primary_interface().strip_diacritics(resposta)
	print(resposta)
	if resposta == "sabedoria para resolver e paciencia para fazer":
		print("GANHOOOOOUUUUUUU")
		$Correct.play()
		emit_signal("senha_correta")
		close()
		
	else:
		print("ERROOOOOOOOOUUUU")
		$Wrong.play()
		close()
