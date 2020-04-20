extends CanvasLayer

signal select_item

var item_scene = preload('res://ui/InventoryItem.tscn')
var item_icons = {
	'Wrench': preload('res://assets/items/Wrench.png')
}
var items: Dictionary = {}

func _ready():
	$DialogueBox.visible = false
	$PopupInventory.visible = false

func start_dialogue(tree):
	get_tree().paused = true
	$DialogueBox.set_tree(tree)
	$DialogueBox.visible = true
	
func end_dialogue():
	$DialogueBox.visible = false
	get_tree().paused = false

func add_item(id, icon):
	var item_icon = item_scene.instance()
	item_icon.get_node('Panel/TextureRect').texture = item_icons.get(icon, null)
	items[id] = item_icon
	$Inventory/Grid.add_child(item_icon)
	var item_icon2 = item_scene.instance()
	item_icon2.get_node('Panel/TextureRect').texture = item_icons.get(icon, null)
	$PopupInventory/CenterContainer/PanelContainer/MarginContainer/Grid.add_child(item_icon2)

func rem_item(id):
	if items.has(id):
		items[id].free()
		items.erase(id)

func reset_items():
	for id in items:
		rem_item(id)

	items.clear()

func popup_inventory():
	if items.empty():
		return

	get_tree().paused = true
	$PopupInventory.visible = true
	# items.values().front().get_node('Panel').grab_focus()

func disable():
	for item in get_children():
		item.visible = false

func enable():
	for item in get_children():
		item.visible = true
	$DialogueBox.visible = !!$DialogueBox.tree

func set_interact_label(value):
	if value:
		$Controls/InteractLabel.text = value
	else:
		$Controls/InteractLabel.text = 'Interact'
	
func set_dog_label(value):
	$Controls/DogLabel.text = value
