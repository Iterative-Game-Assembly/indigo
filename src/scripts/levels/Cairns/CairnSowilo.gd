extends StaticBody2D

signal sowilo

var activate = preload('res://assets/sfx/activate1.wav')

func _interact(_player):
	Audio.play_sfx(activate)
	emit_signal("sowilo")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
