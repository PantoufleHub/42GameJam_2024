extends Npc

func _ready():
	stat = "fire_speed"
	stat_text = "Flame speed"
	cost = 1
	label = get_parent().get_node("UpgradeLabel")
	
func Interact_action(player):
	player.upgrade(stat, cost)
