extends TextureProgressBar

@onready var level_label = $"../LevelLabel"
@onready var points_label = $"../PointsLabel"

var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("../../../../Player")
	value = 0
	player.update_xp.connect(update)

func update():
	level_label.text = "Level " + str(player.level)
	points_label.text = "Pts: " + str(player.upgrade_points)
	value = float(player.xp) / float(player.xp_to_next_level) * 100
	if value == 0:
		value -= 25
	elif value == 100:
		value += 20
