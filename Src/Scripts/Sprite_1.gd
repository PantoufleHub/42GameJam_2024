extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	choose_render(randi_range(0,3))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func choose_render(a):
	if a == 0:
		self.texture = preload("res://Assets/Mob/Flower_pink.png")
	if a == 1:
		self.texture = preload("res://Assets/Mob/Flower_blue.png")
	if a == 2:
		self.texture = preload("res://Assets/Mob/Flower_yellow.png")
	if a == 3:
		self.texture = preload("res://Assets/Mob/Flower_red.png")
