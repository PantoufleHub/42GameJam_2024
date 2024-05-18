extends Npc

func _ready():
	stat = "recharge_speed"
	stat_text = "Recharge speed"
	cost = 1
	label = get_parent().get_node("UpgradeLabel")
	
func Interact_action(player):
	player.upgrade(stat, cost)
