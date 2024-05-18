extends Area2D

var immortal = 0
var density = 0

@export var exp_point = 4
@export var life = 2
var Tier = 2

func _init():
	pass
func _ready():
	pass

func hit(bullet):
	if (!immortal):
		life -= 1
		if life < 1:
			bullet.gain_xp(exp_point)
			queue_free()


func _on_timer_2_timeout():
	if Tier < 3:
		get_parent().spawnn(Tier, position)
		queue_free()
