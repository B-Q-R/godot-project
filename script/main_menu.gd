class_name MainMenu
extends Control

@onready var start_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/Start_Button
@onready var exit_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/Exit_Button
@onready var options_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/Options_Button
@export var start_level = preload("res://escenas/granja.tscn") as PackedScene
@onready var options_menu: OptionsMenu = $Options_Menu
@onready var margin_container: MarginContainer = $MarginContainer
 

func resume():
	get_tree().paused == true
	$AnimationPlayer.play_backwards("blur")

func pause():
	get_tree().paused == false
	$AnimationPlayer.play("blur")


func escMenu():
	if Input.is_action_just_pressed("escape") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("escape") and get_tree().paused == true:
		resume()
		
func _process(delta):
	escMenu()

func _ready(): 
	handle_connecting_signals()	
	
func on_start_pressed():
	get_tree().change_scene_to_packed(start_level)
	
func on_options_pressed():
	margin_container.visible = false
	options_menu.set_process(true)
	options_menu.visible = true

func on_exit_pressed():
	get_tree().quit()

func on_exit_options_menu():
	margin_container.visible = true
	options_menu.visible = false

func handle_connecting_signals():
	start_button.button_down.connect(on_start_pressed)
	options_button.button_down.connect(on_options_pressed)
	exit_button.button_down.connect(on_exit_pressed)
	options_menu.exit_options_menu.connect(on_exit_options_menu)
