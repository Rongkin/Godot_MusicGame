extends BoxContainer

var 布局组 = ["布局1", "布局2", "布局3"]
var 布局号 = 0
var 布局 = 布局组[布局号]

func 切换布局():
	for child in get_children():
		child.visible = false

	布局号 += 1
	
	if 布局号 >= len(布局组):
		布局号 = 0
	
	布局 = 布局组[布局号]
	get_node(布局).visible = true

func _on_切换布局_button_up() -> void:
	切换布局()

func _ready() -> void:
	get_node(布局).visible = true
