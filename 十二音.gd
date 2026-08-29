@tool
extends Control

#自定义属性
@export_range(1, 6, 1) var num_key = 4:
	set(value):
		num_key = value
		update_children()
		

func update_children():
	for child in get_children():
		for child_child in child.get_children():
			child_child.num_key = num_key

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
