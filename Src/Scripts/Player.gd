extends CharacterBody2D

@export var max_fuel = 10
var fuel = max_fuel
var max_fuel_growth = 10

@export var recharge_speed = 1.7
var recharge_speed_growth = 1

@export var move_speed = 8
var move_speed_growth = 1

@export var attack_speed = 5
var attack_speed_growth = 1

@export var fire_speed = 10
var fire_speed_growth = 1

@export var fire_duration = 2
@export var spread = 10
var spread_growth = 20

@export var fire_scale = 1
var fire_scale_growth = 1

@export var number_flames = 1
var number_flames_growth = 1

var flame = preload("res://Src/Actors/Fireball.tscn")

signal update_fuel # to emit signal on fuel quantity change. fuel UI recieves and auto updates
signal update_xp # to emit signal on xp quantity change. xp UI recieves and auto updates

var xp = 0
var level = 1
var xp_to_next_level = 1
var upgrade_points = 0

var time_since_fired = 0
var attack_timer = 0
var mouse_direction
 
func _init():
	pass
func _ready():
	update_xp.emit()

func _process(delta):
	mouse_direction = global_position.direction_to(get_global_mouse_position())
	set_rotation_to_mouse()
	movement()
	fire(delta)

func movement():
	velocity = Vector2.ZERO
	if(Input.is_action_pressed("move_left")):
		velocity.x -= 1
	if(Input.is_action_pressed("move_right")):
		velocity.x += 1
	if(Input.is_action_pressed("move_up")):
		velocity.y -= 1
	if(Input.is_action_pressed("move_down")):
		velocity.y += 1
	move_and_collide(velocity.normalized() * move_speed)
	
func set_rotation_to_mouse():
	rotation = mouse_direction.angle() + deg_to_rad(-90)

func fire(delta):
	if (Input.is_action_pressed("Fire")):
		if  (fuel > 0):
			if (!$BUUURN.playing):
				$BUUURN.play()
	else:
		if ($BUUURN.playing):
			$BUUURN.stop()
	if (Input.is_action_pressed("Fire") && fuel >= 1 && attack_timer >= (1.0/attack_speed)):
		for nb in number_flames:
			var new_flame = flame.instantiate()
			new_flame.rotation = mouse_direction.angle() + deg_to_rad(180)
			new_flame.global_position = $FirePoint.global_position
			new_flame.velocity = mouse_direction.rotated(deg_to_rad(randf_range(-spread, spread))) * fire_speed + (velocity * move_speed) * 0.1
			new_flame.lifespan = fire_duration
			new_flame.fire_scale = Vector2(fire_scale, fire_scale)
			add_sibling(new_flame)
		fuel -= 1
		update_fuel.emit()
		attack_timer = 0
		time_since_fired = 0
	else:
		attack_timer += delta
	if (fuel < max_fuel):
		if(!Input.is_action_pressed("Fire")):
			time_since_fired += delta
			fuel += delta * recharge_speed + (time_since_fired * recharge_speed / 5)
			update_fuel.emit()

func upgrade(stat, cost):
	if upgrade_points >= cost :
		$UPGRADE.play()
		upgrade_points -= cost
		update_xp.emit()
		if (stat == "recharge_speed"):
			recharge_speed += recharge_speed_growth
		if (stat == "move_speed"):
			move_speed += float(move_speed_growth) / float(move_speed * 0.3)
		if (stat == "attack_speed"):
			attack_speed += attack_speed_growth
		if (stat == "fire_speed"):
			fire_speed += fire_speed_growth
		if (stat == "max_fuel"):
			max_fuel += max_fuel_growth
		if (stat == "fire_scale"):
			fire_scale += (fire_scale_growth * 0.10) / fire_scale
		if (stat == "number_flames"):
			number_flames += number_flames
		return 1
	else :
		return 0

func exp(exp):
	update_xp.emit()
	xp += exp
	if xp >= xp_to_next_level:
		level += 1
		xp_to_next_level = clamp((level/10)^5, 0, INF)
		upgrade_points += 1
		xp = 0

func hit(bullet):
	pass
	
	
