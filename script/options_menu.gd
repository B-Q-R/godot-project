class_name OptionsMenu
extends Control

@onready var exit_button: Button = $MarginContainer/VBoxContainer/Exit_Button

signal exit_options_menu

func _ready():
	exit_button.button_down.connect(on_exit_pressed)
	set_process(false) 
	
func on_exit_pressed():
	exit_options_menu.emit()
	set_process(false)
