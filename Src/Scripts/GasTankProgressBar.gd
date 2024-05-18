extends TextureProgressBar

var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("../../../../Player")
	value = 100
	player.update_fuel.connect(update)

func update():
	value = float(float(float(player.fuel) / float(player.max_fuel)) * float(100))
