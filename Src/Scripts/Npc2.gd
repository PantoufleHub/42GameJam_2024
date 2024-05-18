extends Npc

func _ready():
	stat = "fire_scale"
	stat_text = "Fire size"
	cost = 1
	label = get_parent().get_node("UpgradeLabel")

func Interact_action(player):
	player.upgrade(stat, cost)
