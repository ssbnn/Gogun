extends StaticBody2D

signal empty_sign

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_exited(body):
	if body.is_in_group("tile"):
		print("adfasfasdf")
		empty_sign.emit()

