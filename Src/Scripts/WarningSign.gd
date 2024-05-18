extends Node2D

var InterestPoint
var Player
var direction = Vector2.ZERO

var arrow_distance = 75

var max_distance_from_center = 350
var min_distance_from_center = 0
var distance_from_center = 0
var player_distance_from_point = 0


var amplitude = 0.2
var base_scale
var speed = 7
var absolute_time = 0

func _ready():
	Player = get_node("../../../Player")
	InterestPoint = get_node("../../../BBQ")
	base_scale = $Warning.scale
	visible = 1

func _physics_process(delta):
	absolute_time += delta
	
	if (1||(Player && InterestPoint)):
		direction = Player.global_position.direction_to(InterestPoint.global_position)
		player_distance_from_point = Player.global_position.distance_to(InterestPoint.global_position)
		distance_from_center = clamp(player_distance_from_point, min_distance_from_center, max_distance_from_center)
		
		$Arrow.rotation = direction.angle() + deg_to_rad(90)
		$Arrow.global_position = $Warning.global_position + direction * arrow_distance
		
		$Warning.global_position = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y/2) + distance_from_center * direction
		$Warning.scale = Vector2(base_scale.x, base_scale.y + ( amplitude * sin(speed * absolute_time) ))
		
		if (player_distance_from_point >= min_distance_from_center &&
			InterestPoint.get_node("DangerZone").in_danger):
			visible = 1
			if (!$Alert.playing):
				$Alert.play()
		else:
			visible = 0
			if (!$Alert.playing):
				$Alert.stop()
