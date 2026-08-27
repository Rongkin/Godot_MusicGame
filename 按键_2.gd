@tool
extends Control

@export var x = 1:
	set(value):
		x = value
		print(x)
		$Button.text = str(x)
