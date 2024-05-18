extends Area2D


var center_position = Vector2(0,0)

var immortal = 0
var life = 1
var exp_point = 1

var Tier = 1

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
