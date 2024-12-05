extends Control

signal quit
signal resume



func _on_quit_pressed() -> void:
	quit.emit()


func _on_resume_pressed() -> void:
	resume.emit()
