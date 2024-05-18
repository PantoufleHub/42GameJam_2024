extends Area2D
class_name Npc

var can_interact = 0
var stat = ""
var stat_text = ""
var cost = 1
var label
var hold_threshold_base = 0.2
var hold_threshold = hold_threshold_base
var threshold_timer = 0

func Interact_action(player):
	pass

func _process(delta):
	if (can_interact && Input.is_action_just_pressed("interact")):
		Interact_action(get_tree().root.get_node("Level/Player"))
		threshold_timer = 0
		hold_threshold = hold_threshold_base
	elif (can_interact && Input.is_action_pressed("interact") && threshold_timer >= hold_threshold):
		Interact_action(get_tree().root.get_node("Level/Player"))
		threshold_timer = 0
		hold_threshold *= 0.9
	elif (can_interact && threshold_timer < hold_threshold && Input.is_action_pressed("interact")):
		threshold_timer += delta

func _on_body_entered(body):
	update_label_text()
	label.set_base_position($LabelPoint.global_position)
	label.visible = 1
	can_interact = 1
	
func update_label_text():
	label.text = "Upgrade " + stat_text + "\nPrice: " + str(cost)

func _on_body_exited(body):
	get_parent().get_node("UpgradeLabel").visible = 0
	can_interact = 0
