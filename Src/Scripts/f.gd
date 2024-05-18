extends Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	zoom = Vector2(0.25, 0.25)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if zoom.x < 1:
		zoom += (Vector2(1,1) - zoom)/ 35
