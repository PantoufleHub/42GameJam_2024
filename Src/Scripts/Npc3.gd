extends Npc

func _ready():
	stat = "max_fuel"
	stat_text = "Tank size"
	cost = 1
	label = get_parent().get_node("UpgradeLabel")
	
func Interact_action(player):
	player.upgrade(stat, cost)
