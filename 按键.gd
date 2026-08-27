@tool
extends Button

@export var num_key = 4:
	set(value):
		num_key = value
		self.text = note_key + str(num_key)

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
	

func _on_button_down() -> void:
	音频偏移(num_vale, note_vale)
	var num_node = get_node(num_vale)
	#print(num_node.pitch_scale)
	num_node.play()

func _ready() -> void:
	num_vale = num_dict[num_key]
	note_vale = note_dict[note_key]
	音频偏移(num_vale, note_vale)


const 音频_键位 = {
	"C" : [0,"C2", "C3", "C4"],
	"C#": [0,"C#2", "C#3", "C#4"],
	"D" : [0,"D2", "D3", "D4"],
	"D#" : [0,"D#2", "D#3", "D#4"],
	"E" : [0,"E2", "E3", "E4"],
	"F" : [0,"F2", "F3", "F4"],
	"F#" : [0,"F#2", "F#3", "F#4"],
	"G" : [0,"G2", "G3", "G4"],
	"G#" : [0,"G#2", "G#3", "G#4"],
	"A" : [0,"A2", "A3", "A4"],
	"A#" : [0,"A#2", "A#3", "A#4"],
	"B" : [0,"B2", "B3", "B4"],
}

var 鼠标进入 = false
func _input(event):
	if event.is_action_pressed(音频_键位[note_key][num_key - 1]):
		print(note_key+str(num_key))
		_on_button_down()
		toggle_mode = true
		button_pressed = true
	if event.is_action_released(音频_键位[note_key][num_key - 1]):
		toggle_mode = false
		button_pressed = false
	#if event is InputEventMouseMotion:
		#if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			#var num_node = get_node(num_vale)
			#if 鼠标进入 == true and num_node.playing == false:
				#_on_button_down()
				#print("按下"+note_key+str(num_key))
			#if 鼠标进入 == false and num_node.playing == true:
				#num_node.playing = false
	

func _on_mouse_entered() -> void:
	鼠标进入 = true
	

func _on_mouse_exited() -> void:
	鼠标进入 = false
