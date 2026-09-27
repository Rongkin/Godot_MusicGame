extends Control

var 布局组 = [1, 2, 3]
var 布局号 = 1

func 切换布局():
	for i in 布局组:
		if i == 布局号:
			布局号 += 1
			
