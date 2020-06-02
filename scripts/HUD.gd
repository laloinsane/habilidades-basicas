extends Control

var audiobtn = AudioStreamPlayer.new()
var oggbtn = AudioStreamOGGVorbis.new()

func _ready():
	# Childs
	add_child(audiobtn)
	oggbtn = load("res://assets/sounds/click.ogg")
	oggbtn.loop = false
	audiobtn.stream = oggbtn

func update_score(x):
	$Margin3/Score.text = "Puntaje : " + str(x)

func update_level(x):
	$Margin2/Nivel.text = "Nivel : " + str(x)

func _on_ToMenu_pressed():
	audiobtn.play()
	$PopUpBack/Sprite.visible = true
