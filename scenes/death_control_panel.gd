extends Control

signal quit
signal retry



func _on_retry_pressed():
	retry.emit()


func _on_quit_pressed():
	quit.emit()
