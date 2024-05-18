extends Area2D

var lifespan = 1
var velocity = Vector2(10,0)
var fire_scale = Vector2(1.0,1.0)
var timer = 0
@onready var player = $"../Player"

func _ready():
	#lifespan = randf_range(1,2)
	scale = fire_scale
	$Animation.play()

func _physics_process(delta):
	global_position += velocity

func _process(delta):
	rotation = velocity.angle() + deg_to_rad(180)
	timer += delta
	if (timer >= lifespan):
		free()

func _on_area_entered(area):
	if area and area.is_queued_for_deletion() == false:
		area.hit(self)
		queue_free()
func gain_xp(exp):
	player.exp(exp)
func hit(bullet):
	return 0
