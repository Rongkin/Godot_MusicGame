@tool
extends Control

const KEY_SCENE = preload("res://按键.tscn")

const NOTES = [
	"C", "C#", "D", "D#", "E", "F",
	"F#", "G", "G#", "A", "A#", "B"
]

@export_range(0, 71, 1) var begin_num := 0:
	set(value):
		begin_num = value
		update_keys()

@export_range(0, 71, 1) var end_num := 71:
	set(value):
		end_num = value
		update_keys()


func update_keys():
	if not is_node_ready():
		return

	var container = $VBoxContainer

	# 删除原来的按键
	for child in container.get_children():
		child.queue_free()

	# 创建新的按键
	for i in range(begin_num, end_num + 1):
		var note_index = i % 12 #取余数获得用于音名
		var octave = 1 + i / 12 #整除获得数字,用于八度号

		var key = KEY_SCENE.instantiate()

		key.note_key = NOTES[note_index]
		key.num_key = octave

		container.add_child(key)

func _ready():
	update_keys()
