extends Npc

func _ready():
	stat = "move_speed"
	stat_text = "Movement speed"
	cost = 1
	label = get_parent().get_node("UpgradeLabel")
	
func Interact_action(player):
	player.upgrade(stat, cost)
