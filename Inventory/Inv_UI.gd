extends Control

@onready var inv: Inv = preload("res://Inventory/playerinv.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()
@onready var gold_key: InvItem = preload("res://Inventory/items/gold_key.tres")


var is_open = false
var select1 = false
var select2 = false
var select3 = false
var select4 = false
var select5 = false
var select6 = false
var select7 = false
var select8 = false
var select9 = false


func _ready():
	inv.update.connect(update_slots)
	update_slots()
	
func update_slots():
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i])
		
func contains_item(item: InvItem):
	for i in range (min(inv.slots.size(), slots.size())):
		if slots[i].contains(inv.slots[i], item):
			return true
	return false	
	
func _process(delta):
	if select1:
		$NinePatchRect/GridContainer/inv_UI_slot1/select.visible = true
	else:
		$NinePatchRect/GridContainer/inv_UI_slot1/select.visible = false
	if select2:
		$NinePatchRect/GridContainer/inv_UI_slot2/select.visible = true
	else:
		$NinePatchRect/GridContainer/inv_UI_slot2/select.visible = false
	if select3:
		$NinePatchRect/GridContainer/inv_UI_slot3/select.visible = true
	else:
		$NinePatchRect/GridContainer/inv_UI_slot3/select.visible = false
	if select4:
		$NinePatchRect/GridContainer/inv_UI_slot4/select.visible = true
	else:
		$NinePatchRect/GridContainer/inv_UI_slot4/select.visible = false
	if select5:
		$NinePatchRect/GridContainer/inv_UI_slot5/select.visible = true
	else:
		$NinePatchRect/GridContainer/inv_UI_slot5/select.visible = false
	if select6:
		$NinePatchRect/GridContainer/inv_UI_slot6/select.visible = true
	else:
		$NinePatchRect/GridContainer/inv_UI_slot6/select.visible = false	
	if select7:
		$NinePatchRect/GridContainer/inv_UI_slot7/select.visible = true
	else:
		$NinePatchRect/GridContainer/inv_UI_slot7/select.visible = false	
	if select8:
		$NinePatchRect/GridContainer/inv_UI_slot8/select.visible = true
	else:
		$NinePatchRect/GridContainer/inv_UI_slot8/select.visible = false	
	if select9:
		$NinePatchRect/GridContainer/inv_UI_slot9/select.visible = true
	else:
		$NinePatchRect/GridContainer/inv_UI_slot9/select.visible = false
		
				
func _input(event):
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_1:
				_set_select(1)
				set_labels(1)
			KEY_2:
				_set_select(2)
				set_labels(2)
			KEY_3:
				_set_select(3)
				set_labels(3)
			KEY_4:
				_set_select(4)
				set_labels(4)
			KEY_5:
				_set_select(5)
				set_labels(5)
			KEY_6:
				_set_select(6)
				set_labels(6)
			KEY_7:
				_set_select(7)
				set_labels(7)
			KEY_8:
				_set_select(8)
				set_labels(8)
			KEY_9:
				_set_select(9)
				set_labels(0)

func _set_select(index: int) -> void:
	select1 = false
	select2 = false
	select3 = false
	select4 = false
	select5 = false
	select6 = false
	select7 = false
	select8 = false
	select9 = false

	match index:
		1:
			select1 = true
		2:
			select2 = true
		3:
			select3 = true
		4:
			select4 = true
		5:
			select5 = true
		6:
			select6 = true
		7:
			select7 = true
		8:
			select8 = true
		9:
			select9 = true
		
func set_labels(index: int) -> void:
	var nome_slot = "inv_UI_slot%d" % index
	if not has_node("NinePatchRect/GridContainer/" + nome_slot):
		print("Slot não encontrado:", nome_slot)
		return
	
	var node = get_node("NinePatchRect/GridContainer/" + nome_slot)
	var slot_index = index - 1  # Corrigindo para índice de array
	
	if slot_index >= 0 and slot_index < inv.slots.size():
		var slot = inv.slots[slot_index]
		if slot.item != null:
			$Nome.text = slot.item.name
			$Nome/Description.text = slot.item.description
		else:
			$Nome.text = ""
			$Nome/Description.text = ""
	else:
		print("Índice de slot fora do intervalo:", slot_index)

