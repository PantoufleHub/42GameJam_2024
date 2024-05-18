extends Npc

func _ready():
	stat = "attack_speed"
	stat_text = "Attack speed"
	cost = 1
	label = get_parent().get_node("UpgradeLabel")

func Interact_action(player):
	player.upgrade(stat, cost)
