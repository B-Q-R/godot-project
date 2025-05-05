extends StaticBody2D

var plant = Global.plantSelected
var plantGrowing = false
var plantGrown = false

func _physics_process(delta: float):
	# print(Global.plantSelected)
	if plantGrowing == false:
		plant = Global.plantSelected


func _on_area_2d_area_entered(area: Area2D):
	if not plantGrowing:
		if plant == 1:
			plantGrowing = true
			$carrotTimer.start()
			$plant.play("carrotAnimation")
		if plant == 2:
			plantGrowing = true
			$onionTimer.start()
			$plant.play("onionAnimation")
		if plant == 3:
			plantGrowing = true
			$potatoTimer.start()
			$plant.play("potatoAnimation")
		if plant == 4:
			plantGrowing = true
			$turnipTimer.start()
			$plant.play("turnipAnimation")
		if plant == 5:
			plantGrowing = true
			$spinachTimer.start()
			$plant.play("spinachAnimation")
		if plant == 6:
			plantGrowing = true
			$radishTimer.start()
			$plant.play("radishAnimation")
	else:
		print("Plant is already growing here...")

func _on_carrot_timer_timeout() -> void:
	var carrot_plant = $plant
	if carrot_plant.frame == 0:
		carrot_plant.frame = 1
		$carrotTimer.start()
	elif carrot_plant.frame == 1:
		carrot_plant.frame = 2
		plantGrown = true

func _on_potato_timer_timeout() -> void:
	var potato_plant = $plant
	if potato_plant.frame == 0:
		potato_plant.frame = 1
		$potatoTimer.start()
	elif potato_plant.frame == 1:
		potato_plant.frame = 2
		plantGrown = true

func _on_spinach_timer_timeout() -> void:
	var spinach_plant = $plant
	if spinach_plant.frame == 0:
		spinach_plant.frame = 1
		$spinachTimer.start()
	elif spinach_plant.frame == 1:
		spinach_plant.frame = 2
		plantGrown = true

func _on_radish_timer_timeout() -> void:
	var radish_plant = $plant
	if radish_plant.frame == 0:
		radish_plant.frame = 1
		$radishTimer.start()
	elif radish_plant.frame == 1:
		radish_plant.frame = 2
		plantGrown = true

func _on_onion_timer_timeout() -> void:
	var onion_plant = $plant
	if onion_plant.frame == 0:
		onion_plant.frame = 1
		$onionTimer.start()
	elif onion_plant.frame == 1:
		onion_plant.frame = 2
		plantGrown = true

func _on_turnip_timer_timeout() -> void:
	var turnip_plant = $plant
	if turnip_plant.frame == 0:
		turnip_plant.frame = 1
		$turnipTimer.start()
	elif turnip_plant.frame == 1:
		turnip_plant.frame = 2
		plantGrown = true


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		if plantGrown:
			if plant == 1:
				print("if 1")
				Global.numCarrots += 1
				print("if 1 suma")
				plantGrowing = false
				plantGrown = false
				print("if 1 conversion false")
				$plant.play("noPlants")
				print("if 1 accion noPlants")
			if plant == 2:
				print("if 2")
				Global.numOnions += 1
				print("if 1 suma")
				plantGrowing = false
				plantGrown = false
				print("if 1 conversion false")
				$plant.play("noPlants")
				print("if 1 accion noPlants")
			if plant == 3:
				Global.numPotatoes += 1
				plantGrowing = false
				plantGrown = false
				$plant.play("noPlants")
			else:
				pass
		print("Numero de zanahorias: " + str(Global.numCarrots))
		print("Numero de cebollas: " + str(Global.numOnions))
		print("Numero de papas: " + str(Global.numPotatoes))
		
		
