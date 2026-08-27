extends BoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#声调
const 音名组 = {
	"C4": 0,
	"C4#": 1, "D4b": 1,
	"D4": 2,
	"D4#": 3, "E4b": 3,
	"E4": 4,
	"F4": 5,
	"F4#": 6, "G4b": 6,
	"G4": 7,
	"G4#": 8, "A4b": 8,
	"A4": 9,
	"A4#": 10, "B4b": 10,
	"B4": 11
}
func 音名比值(音名:String) -> float:
	return pow(2.0, 音名组[音名] / 12.0) #返回2的次方, 表示


#C4
func _on_c_4_button_down() -> void:
	$AudioStreamPlayer.pitch_scale = 音名比值("C4")
	$AudioStreamPlayer.play()

#D4
func _on_d_4_button_down() -> void:
	$AudioStreamPlayer.pitch_scale = 音名比值("D4")
	$AudioStreamPlayer.play()

#E4
func _on_e_4_button_down() -> void:
	$AudioStreamPlayer.pitch_scale = 音名比值("E4")
	$AudioStreamPlayer.play()

#F4
func _on_f_4_button_down() -> void:
	$AudioStreamPlayer.pitch_scale = 音名比值("F4")
	$AudioStreamPlayer.play()

#G4
func _on_g_4_button_down() -> void:
	$AudioStreamPlayer.pitch_scale = 音名比值("G4")
	$AudioStreamPlayer.play()

#A4
func _on_a_4_button_down() -> void:
	$AudioStreamPlayer.pitch_scale = 音名比值("A4")
	$AudioStreamPlayer.play()

#B4
func _on_b_4_button_down() -> void:
	$AudioStreamPlayer.pitch_scale = 音名比值("B4")
	$AudioStreamPlayer.play()



func _input(event: InputEvent) -> void:
	if event.is_action_pressed("A"):
		_on_c_4_button_down()
		$C4.toggle_mode = true
		$C4.button_pressed = true
	if event.is_action_released("A"):
		$C4.toggle_mode = false
		$C4.button_pressed = false
	if event.is_action_pressed("S"):
		_on_d_4_button_down()
		$D4.toggle_mode = true
		$D4.button_pressed = true
	if event.is_action_released("S"):
		$D4.toggle_mode = false
		$D4.button_pressed = false
		
