extends Area2D


var center_position = Vector2(0,0)

var immortal = 0
var density = 0

@onready var area_check = $"propagate area"
@export var max_density = 4
@export var exp_point = 8
@export var life = 7
var base_distance = 600

var Tier = 3

func _init():
	pass
func _ready():
	density = area_check.get_overlapping_areas().size()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	pass
func propagate():
	if (density < max_density && Tier > 2):
		var current_global_position = global_position  # Use global position
		# Calculate direction from current global position to the global center
		var direction = (center_position - current_global_position).normalized()
		# Introduce randomness to the direction
		var random_angle = deg_to_rad(randi_range(-90,90))  # Random angle between -22.5 to +22.5 degrees
		direction = direction.rotated(random_angle)
		var random_distance = base_distance * randf_range(0.8, 1.4)  # Randomize distance by 20%
		var positionn = current_global_position + direction * random_distance
		get_parent().spawnn(0, positionn)
		

func _on_timer_timeout():
	#print("test")
	density = area_check.get_overlapping_areas().size()
	propagate()
	pass # Replace with function body.



func hit(bullet):
	if (!immortal):
		life -= 1
		if life < 1:
			bullet.gain_xp(exp_point)
			queue_free()


func _on_timer_2_timeout():
	if base_distance < 600:
		base_distance += 10 # Base distance
