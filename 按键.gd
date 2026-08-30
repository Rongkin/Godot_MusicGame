@tool
extends Button

#自定义属性
@export_range(1, 6, 1) var num_key = 4:
	set(value):
		num_key = value
		self.text = note_key + str(num_key)
		按键颜色()

#@export var note_key = "C"
@export_enum("C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B")
var note_key := "C":
	set(value):
		note_key = value
		self.text = note_key + str(num_key)


#音域
const  num_dict = {1:"A1", 2:"A2", 3:"A3", 4:"A4", 5:"A5", 6:"A6"}
var num_vale = num_dict[num_key]

#音调
const  note_dict = {
	"C":0,
	"C#":1,
	"D":2, 
	"D#":3, 
	"E":4, 
	"F":5, 
	"F#":6, 
	"G":7, 
	"G#":8,
	"A":9, 
	"A#":10,
	"B":11}
var note_vale = note_dict[note_key]


#计算音调需要的频率缩放
func 音频偏移(num_vale, note_vale):
	var num_node = get_node(num_vale)
	num_node.pitch_scale = pow(2.0, (note_vale - 9) / 12.0)
	

#点击按钮
func _on_button_down() -> void:
	var num_node = get_node(num_vale)
	num_node.play()

func _ready() -> void:
	num_vale = num_dict[num_key]
	note_vale = note_dict[note_key]
	音频偏移(num_vale, note_vale)
	按键颜色()


const 音频_键位 = {
	"C" : ["","C2", "C3", "C4","","",""],
	"C#": ["","C#2", "C#3", "C#4","","",""],
	"D" : ["","D2", "D3", "D4","","",""],
	"D#" : ["","D#2", "D#3", "D#4","","",""],
	"E" : ["","E2", "E3", "E4","","",""],
	"F" : ["","F2", "F3", "F4","","",""],
	"F#" : ["","F#2", "F#3", "F#4","","",""],
	"G" : ["","G2", "G3", "G4","","",""],
	"G#" : ["","G#2", "G#3", "G#4","","",""],
	"A" : ["","A2", "A3", "A4","","",""],
	"A#" : ["","A#2", "A#3", "A#4","","",""],
	"B" : ["","B2", "B3", "B4","","",""],
}

#键盘控制
func _input(event):
	if event.is_action_pressed(音频_键位[note_key][num_key - 1]):
		print(note_key+str(num_key))
		_on_button_down()
		toggle_mode = true
		button_pressed = true
	if event.is_action_released(音频_键位[note_key][num_key - 1]):
		toggle_mode = false
		button_pressed = false

func 按键颜色():
	var style = get_theme_stylebox("normal").duplicate()
	if "#" in note_key: 
		style.bg_color = Color.from_hsv(num_key/8.0, 0.2, 0.8)
	else:
		style.bg_color = Color.from_hsv(num_key/8.0, 0.8, 0.8)
	style.corner_radius_top_left = 30
	style.corner_radius_top_right = 30
	style.corner_radius_bottom_left = 30
	style.corner_radius_bottom_right = 30
	
	add_theme_stylebox_override("normal", style)
