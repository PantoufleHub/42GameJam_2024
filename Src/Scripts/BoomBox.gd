extends Npc

func _ready():
	stat = "number_flames"
	stat_text = "Number of flames"
	cost = 30
	label = get_parent().get_node("UpgradeLabel")

func Interact_action(player):
	if (player.upgrade(stat, cost)):
		cost += cost
		update_label_text()
