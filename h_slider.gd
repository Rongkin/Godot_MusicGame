extends HSlider



var master_bus := AudioServer.get_bus_index("Master")


func 音量(value = self.value):
	return value*50/100 - 40

func _ready():
	AudioServer.set_bus_volume_db(master_bus,音量())



func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(master_bus,音量())
	print(value)
