extends Control

signal quit
signal resume

func _on_quit_pressed():
	quit.emit()


func _on_resume_pressed():
	resume.emit()
