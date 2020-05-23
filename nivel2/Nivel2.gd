extends Node2D

export(PackedScene) var Objeto
const objects_file = "res://data/animals.json"
var json
var audio = AudioStreamPlayer.new()
var ogg = AudioStreamOGGVorbis.new()
var seleccionados = 0
var intentos_level = 0
var level = 1
var score_level = 0
var score_user = 0
var score_total = 0
var time_left = 2
var popup_status = 0
var eleccion_correcta = false
var eleccion_correcta2 = false
var eleccion_correcta3 = false

func _ready():
	# Panels
	$Main/VBox/HBox/VBox/HBox/Margin1.visible = true
	$Main/VBox/HBox/VBox/HBox/Margin2.visible = true
	$Main/VBox/HBox/VBox/HBox/Margin3.visible = false
	$Main/VBox/HBox/VBox/HBox/Margin4.visible = false
	# PopUp
	$PopUp.visible = false
	# Labels
	$TopPanel.update_level(level)
	$TopPanel.update_score(score_total)
	$Main.update_indicaciones("ESCUCHA CON ATENCION\n\nY ORDENA LAS IMAGENES SEGUN LO ESCUCHADO.")
	# Transition
	$Transition.visible = true
	$Transition/AnimationPlayer.play("fade-out")
	yield($Transition/AnimationPlayer, "animation_finished")
	$Transition.visible = false
	# Containers
	$Objects.visible = false
	$ObjectsSounds.visible = false
	$ObjectsOptions.visible = false
	# Childs
	add_child(audio)
	# Functions
	json = read_json()
	set_objects(json)
	set_sounds(2)
	set_options(json, 0)

func _process(delta):
	var cursor_pos = get_global_mouse_position()
	if level == 1 and $ObjectsOptions.get_child_count() != 0:
		var count = 0
		for i in $ObjectsOptions.get_children():
			if $ObjectsOptions.get_child(count).in_action == true:
				if $Main/VBox/HBox/VBox/HBox/Margin1/Panel1.get_global_rect().has_point(cursor_pos) and $Main/VBox/HBox/VBox/HBox/Margin1/Panel1.contain_slot_item == false:
					if $ObjectsOptions.get_child(count).liberado == true:
						$ObjectsOptions.get_child(count).set_obj_slot($Main/VBox/HBox/VBox/HBox/Margin1/Panel1.get_global_rect().position.x, $Main/VBox/HBox/VBox/HBox/Margin1/Panel1.get_global_rect().position.y, 1)
						$Main/VBox/HBox/VBox/HBox/Margin1/Panel1.set_slot_item(true)
				elif $Main/VBox/HBox/VBox/HBox/Margin2/Panel2.get_global_rect().has_point(cursor_pos) and $Main/VBox/HBox/VBox/HBox/Margin2/Panel2.contain_slot_item == false:
					if $ObjectsOptions.get_child(count).liberado == true:
						$ObjectsOptions.get_child(count).set_obj_slot($Main/VBox/HBox/VBox/HBox/Margin2/Panel2.get_global_rect().position.x, $Main/VBox/HBox/VBox/HBox/Margin2/Panel2.get_global_rect().position.y, 2)
						$Main/VBox/HBox/VBox/HBox/Margin2/Panel2.set_slot_item(true)
				elif $ObjectsOptions.get_child(count).liberado == true:
					$ObjectsOptions.get_child(count).reset_start_position()
			count += 1
	if level == 2 and $ObjectsOptions.get_child_count() != 0:
		var count = 0
		for i in $ObjectsOptions.get_children():
			if $ObjectsOptions.get_child(count).in_action == true:
				if $Main/VBox/HBox/VBox/HBox/Margin1/Panel1.get_global_rect().has_point(cursor_pos) and $Main/VBox/HBox/VBox/HBox/Margin1/Panel1.contain_slot_item == false:
					if $ObjectsOptions.get_child(count).liberado == true:
						$ObjectsOptions.get_child(count).set_obj_slot($Main/VBox/HBox/VBox/HBox/Margin1/Panel1.get_global_rect().position.x, $Main/VBox/HBox/VBox/HBox/Margin1/Panel1.get_global_rect().position.y, 1)
						$Main/VBox/HBox/VBox/HBox/Margin1/Panel1.set_slot_item(true)
				elif $Main/VBox/HBox/VBox/HBox/Margin2/Panel2.get_global_rect().has_point(cursor_pos) and $Main/VBox/HBox/VBox/HBox/Margin2/Panel2.contain_slot_item == false:
					if $ObjectsOptions.get_child(count).liberado == true:
						$ObjectsOptions.get_child(count).set_obj_slot($Main/VBox/HBox/VBox/HBox/Margin2/Panel2.get_global_rect().position.x, $Main/VBox/HBox/VBox/HBox/Margin2/Panel2.get_global_rect().position.y, 2)
						$Main/VBox/HBox/VBox/HBox/Margin2/Panel2.set_slot_item(true)
				elif $ObjectsOptions.get_child(count).liberado == true:
					$ObjectsOptions.get_child(count).reset_start_position()
			count += 1
	if level == 3 and $ObjectsOptions.get_child_count() != 0:
		var count = 0
		for i in $ObjectsOptions.get_children():
			if $ObjectsOptions.get_child(count).in_action == true:
				if $Main/VBox/HBox/VBox/HBox/Margin1/Panel1.get_global_rect().has_point(cursor_pos) and $Main/VBox/HBox/VBox/HBox/Margin1/Panel1.contain_slot_item == false:
					if $ObjectsOptions.get_child(count).liberado == true:
						$ObjectsOptions.get_child(count).set_obj_slot($Main/VBox/HBox/VBox/HBox/Margin1/Panel1.get_global_rect().position.x, $Main/VBox/HBox/VBox/HBox/Margin1/Panel1.get_global_rect().position.y, 1)
						$Main/VBox/HBox/VBox/HBox/Margin1/Panel1.set_slot_item(true)
				elif $Main/VBox/HBox/VBox/HBox/Margin2/Panel2.get_global_rect().has_point(cursor_pos) and $Main/VBox/HBox/VBox/HBox/Margin2/Panel2.contain_slot_item == false:
					if $ObjectsOptions.get_child(count).liberado == true:
						$ObjectsOptions.get_child(count).set_obj_slot($Main/VBox/HBox/VBox/HBox/Margin2/Panel2.get_global_rect().position.x, $Main/VBox/HBox/VBox/HBox/Margin2/Panel2.get_global_rect().position.y, 2)
						$Main/VBox/HBox/VBox/HBox/Margin2/Panel2.set_slot_item(true)
				elif $Main/VBox/HBox/VBox/HBox/Margin3/Panel3.get_global_rect().has_point(cursor_pos) and $Main/VBox/HBox/VBox/HBox/Margin3/Panel3.contain_slot_item == false:
					if $ObjectsOptions.get_child(count).liberado == true:
						$ObjectsOptions.get_child(count).set_obj_slot($Main/VBox/HBox/VBox/HBox/Margin3/Panel3.get_global_rect().position.x, $Main/VBox/HBox/VBox/HBox/Margin3/Panel3.get_global_rect().position.y, 3)
						$Main/VBox/HBox/VBox/HBox/Margin3/Panel3.set_slot_item(true)
				elif $ObjectsOptions.get_child(count).liberado == true:
					$ObjectsOptions.get_child(count).reset_start_position()
			count += 1
	if level == 4 and $ObjectsOptions.get_child_count() != 0:
		var count = 0
		for i in $ObjectsOptions.get_children():
			if $ObjectsOptions.get_child(count).in_action == true:
				if $Main/VBox/HBox/VBox/HBox/Margin1/Panel1.get_global_rect().has_point(cursor_pos) and $Main/VBox/HBox/VBox/HBox/Margin1/Panel1.contain_slot_item == false:
					if $ObjectsOptions.get_child(count).liberado == true:
						$ObjectsOptions.get_child(count).set_obj_slot($Main/VBox/HBox/VBox/HBox/Margin1/Panel1.get_global_rect().position.x, $Main/VBox/HBox/VBox/HBox/Margin1/Panel1.get_global_rect().position.y, 1)
						$Main/VBox/HBox/VBox/HBox/Margin1/Panel1.set_slot_item(true)
				elif $Main/VBox/HBox/VBox/HBox/Margin2/Panel2.get_global_rect().has_point(cursor_pos) and $Main/VBox/HBox/VBox/HBox/Margin2/Panel2.contain_slot_item == false:
					if $ObjectsOptions.get_child(count).liberado == true:
						$ObjectsOptions.get_child(count).set_obj_slot($Main/VBox/HBox/VBox/HBox/Margin2/Panel2.get_global_rect().position.x, $Main/VBox/HBox/VBox/HBox/Margin2/Panel2.get_global_rect().position.y, 2)
						$Main/VBox/HBox/VBox/HBox/Margin2/Panel2.set_slot_item(true)
				elif $Main/VBox/HBox/VBox/HBox/Margin3/Panel3.get_global_rect().has_point(cursor_pos) and $Main/VBox/HBox/VBox/HBox/Margin3/Panel3.contain_slot_item == false:
					if $ObjectsOptions.get_child(count).liberado == true:
						$ObjectsOptions.get_child(count).set_obj_slot($Main/VBox/HBox/VBox/HBox/Margin3/Panel3.get_global_rect().position.x, $Main/VBox/HBox/VBox/HBox/Margin3/Panel3.get_global_rect().position.y, 3)
						$Main/VBox/HBox/VBox/HBox/Margin3/Panel3.set_slot_item(true)
				elif $Main/VBox/HBox/VBox/HBox/Margin4/Panel4.get_global_rect().has_point(cursor_pos) and $Main/VBox/HBox/VBox/HBox/Margin4/Panel4.contain_slot_item == false:
					if $ObjectsOptions.get_child(count).liberado == true:
						$ObjectsOptions.get_child(count).set_obj_slot($Main/VBox/HBox/VBox/HBox/Margin4/Panel4.get_global_rect().position.x, $Main/VBox/HBox/VBox/HBox/Margin4/Panel4.get_global_rect().position.y, 4)
						$Main/VBox/HBox/VBox/HBox/Margin4/Panel4.set_slot_item(true)
				elif $ObjectsOptions.get_child(count).liberado == true:
					$ObjectsOptions.get_child(count).reset_start_position()
			count += 1

func read_json():
	var file = File.new()
	if file.file_exists(objects_file):
		file.open(objects_file, File.READ)
		var data = parse_json(file.get_as_text())
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			return data
		else:
			printerr("Corrupted data!")
	else:
		printerr("File don't exist!")

func set_objects(x):
	var deck = Array()
	for i in x:
		deck.append(i)
	var indexList = range(deck.size())
	for i in range(deck.size()):
		randomize()
		var y = randi()%indexList.size()	
		for z in x:
			if z == deck[y]:
				var obj = Objeto.instance()
				obj.set_id(z)
				obj.set_nombre(x[z]["name"])
				obj.set_code(x[z]["code"])
				obj.set_sound(x[z]["sound"])
				obj.set_image(x[z]["image"])
				$Objects.add_child(obj)
		indexList.remove(y)
		deck.remove(y)

func set_sounds(x):
	var count = 0
	var countAudio = 0
	for i in $Objects.get_children():
		if count >= $Objects.get_child_count() - x:
			var obj = $Objects.get_child(count)
			obj.set_order_audio($ObjectsSounds.get_child_count()+1)
			$Objects.remove_child(i)
			$ObjectsSounds.add_child(obj)
		else:
			count += 1

func set_options(x, agregar):
	# Distribucion de los objetos
	var all = Array()
	var options = Array()
	for i in x:
		var existe = false
		for j in $ObjectsSounds.get_children():
			if x[i]["code"] == j.code:
				existe = true
		if existe == false:
			all.append(i)
		else:
			options.append(i)

	# Inclucion de objetos extras
	var indexList = range(all.size())
	for i in range(agregar):
		randomize()
		var y = randi()%indexList.size()
		for z in all:
			if z == all[y]:
				options.append(z)
		indexList.remove(y)
		all.remove(y)
	
	var card_x = 601 - (175 * (options.size()-1))
	var card_width = 205
	var in_list = range(options.size())
	for i in range(options.size()):
		randomize()
		var y = randi()%in_list.size()	
		for z in x:
			if z == options[y]:
				var obj = Objeto.instance()
				obj.set_id(z)
				obj.set_nombre(x[z]["name"])
				obj.set_code(x[z]["code"])
				obj.set_sound(x[z]["sound"])
				obj.set_image(x[z]["image"])
				obj.position = Vector2(card_x,530)
				obj.set_start_position(card_x, 530)
				obj.connect("is_order_and_code", self, "_is_order_and_code", [obj])
				card_x = card_x + card_width
				$ObjectsOptions.add_child(obj)
		in_list.remove(y)
		options.remove(y)

# Main
func _on_Escuchar_pressed():
	if level == 1 and seleccionados != 2:
		$Main/VBox/HBox/Margin2/Escuchar.texture_normal = load("res://assets/buttons/nivels/audio-press.png")
		$Main/VBox/HBox/Margin2/Escuchar.disabled = true
		for i in $ObjectsSounds.get_children():
			if seleccionados != 2:
				ogg = load(i.get_sound())
				ogg.loop = false
				audio.stream = ogg
				audio.play()
				yield(audio, "finished")
			else:
				break
		$Main/VBox/HBox/Margin2/Escuchar.disabled = false
		$ObjectsOptions.visible = true
		$Main/VBox/HBox/Margin2/Escuchar.texture_normal = load("res://assets/buttons/nivels/audio-basic.png")
	if level == 2 and seleccionados != 2:
		$Main/VBox/HBox/Margin2/Escuchar.texture_normal = load("res://assets/buttons/nivels/audio-press.png")
		$Main/VBox/HBox/Margin2/Escuchar.disabled = true
		for i in $ObjectsSounds.get_children():
			if seleccionados != 2:
				ogg = load(i.get_sound())
				ogg.loop = false
				audio.stream = ogg
				audio.play()
				yield(audio, "finished")
			else:
				break
		$Main/VBox/HBox/Margin2/Escuchar.disabled = false
		$ObjectsOptions.visible = true
		$Main/VBox/HBox/Margin2/Escuchar.texture_normal = load("res://assets/buttons/nivels/audio-basic.png")
	if level == 3 and seleccionados != 3:
		$Main/VBox/HBox/Margin2/Escuchar.texture_normal = load("res://assets/buttons/nivels/audio-press.png")
		$Main/VBox/HBox/Margin2/Escuchar.disabled = true
		for i in $ObjectsSounds.get_children():
			if seleccionados != 3:
				ogg = load(i.get_sound())
				ogg.loop = false
				audio.stream = ogg
				audio.play()
				yield(audio, "finished")
			else:
				break
		$Main/VBox/HBox/Margin2/Escuchar.disabled = false
		$ObjectsOptions.visible = true
		$Main/VBox/HBox/Margin2/Escuchar.texture_normal = load("res://assets/buttons/nivels/audio-basic.png")
	if level == 4 and seleccionados != 4:
		$Main/VBox/HBox/Margin2/Escuchar.texture_normal = load("res://assets/buttons/nivels/audio-press.png")
		$Main/VBox/HBox/Margin2/Escuchar.disabled = true
		for i in $ObjectsSounds.get_children():
			if seleccionados != 4:
				ogg = load(i.get_sound())
				ogg.loop = false
				audio.stream = ogg
				audio.play()
				yield(audio, "finished")
			else:
				break
		$Main/VBox/HBox/Margin2/Escuchar.disabled = false
		$ObjectsOptions.visible = true
		$Main/VBox/HBox/Margin2/Escuchar.texture_normal = load("res://assets/buttons/nivels/audio-basic.png")

# Funcion que se ejecuta al soltar un elemento sobre un slot
func _is_order_and_code(x):
	if level == 1:
		if seleccionados == 0:
			seleccionados += 1
			var existe = false
			for i in $ObjectsSounds.get_children():
				if x.order_slot != 0 and x.order_slot == i.order_audio:
					if i.code == x.code:
						existe = true
			if existe == true:
				eleccion_correcta = true
				correct(x)
			else:
				incorrect(x)
		elif seleccionados == 1:
			seleccionados += 1
			intentos_level += 1
			audio.stop()
			var existe = false
			for i in $ObjectsSounds.get_children():
				if x.order_slot != 0 and x.order_slot == i.order_audio:
					if i.code == x.code:
						existe = true
			if existe == true:
				correct(x)
			else:
				incorrect(x)
	if level == 2:
		if seleccionados == 0:
			seleccionados += 1
			var existe = false
			for i in $ObjectsSounds.get_children():
				if x.order_slot != 0 and x.order_slot == i.order_audio:
					if i.code == x.code:
						existe = true
			if existe == true:
				eleccion_correcta = true
				correct(x)
			else:
				incorrect(x)
		elif seleccionados == 1:
			seleccionados += 1
			intentos_level += 1
			audio.stop()
			var existe = false
			for i in $ObjectsSounds.get_children():
				if x.order_slot != 0 and x.order_slot == i.order_audio:
					if i.code == x.code:
						existe = true
			if existe == true:
				correct(x)
			else:
				incorrect(x)
	if level == 3:
		if seleccionados == 0:
			seleccionados += 1
			var existe = false
			for i in $ObjectsSounds.get_children():
				if x.order_slot != 0 and x.order_slot == i.order_audio:
					if i.code == x.code:
						existe = true
			if existe == true:
				eleccion_correcta = true
				correct(x)
			else:
				incorrect(x)
		elif seleccionados == 1:
			seleccionados += 1
			var existe = false
			for i in $ObjectsSounds.get_children():
				if x.order_slot != 0 and x.order_slot == i.order_audio:
					if i.code == x.code:
						existe = true
			if existe == true:
				eleccion_correcta2 = true
				correct(x)
			else:
				incorrect(x)
		elif seleccionados == 2:
			seleccionados += 1
			intentos_level += 1
			audio.stop()
			var existe = false
			for i in $ObjectsSounds.get_children():
				if x.order_slot != 0 and x.order_slot == i.order_audio:
					if i.code == x.code:
						existe = true
			if existe == true:
				correct(x)
			else:
				incorrect(x)
	if level == 4:
		if seleccionados == 0:
			seleccionados += 1
			var existe = false
			for i in $ObjectsSounds.get_children():
				if x.order_slot != 0 and x.order_slot == i.order_audio:
					if i.code == x.code:
						existe = true
			if existe == true:
				eleccion_correcta = true
				correct(x)
			else:
				incorrect(x)
		elif seleccionados == 1:
			seleccionados += 1
			var existe = false
			for i in $ObjectsSounds.get_children():
				if x.order_slot != 0 and x.order_slot == i.order_audio:
					if i.code == x.code:
						existe = true
			if existe == true:
				eleccion_correcta2 = true
				correct(x)
			else:
				incorrect(x)
		elif seleccionados == 2:
			seleccionados += 1
			var existe = false
			for i in $ObjectsSounds.get_children():
				if x.order_slot != 0 and x.order_slot == i.order_audio:
					if i.code == x.code:
						existe = true
			if existe == true:
				eleccion_correcta3 = true
				correct(x)
			else:
				incorrect(x)
		elif seleccionados == 3:
			seleccionados += 1
			intentos_level += 1
			audio.stop()
			var existe = false
			for i in $ObjectsSounds.get_children():
				if x.order_slot != 0 and x.order_slot == i.order_audio:
					if i.code == x.code:
						existe = true
			if existe == true:
				correct(x)
			else:
				incorrect(x)

func correct(x):
	if level == 1:
		if seleccionados == 1:
			x.set_status("res://assets/icons/correct.png")
		elif seleccionados == 2:
			if eleccion_correcta == true:
				score_level += 1
				score_total += 1
			$TopPanel.update_score(score_total)
			x.set_status("res://assets/icons/correct.png")
			$Timer.start()
	if level == 2:
		if seleccionados == 1:
			x.set_status("res://assets/icons/correct.png")
		elif seleccionados == 2:
			if eleccion_correcta == true:
				score_level += 1
				score_total += 1
			$TopPanel.update_score(score_total)
			x.set_status("res://assets/icons/correct.png")
			$Timer.start()
	if level == 3:
		if seleccionados == 1:
			x.set_status("res://assets/icons/correct.png")
		elif seleccionados == 2:
			x.set_status("res://assets/icons/correct.png")
		elif seleccionados == 3:
			if eleccion_correcta == true and eleccion_correcta2 == true:
				score_level += 1
				score_total += 1
			$TopPanel.update_score(score_total)
			x.set_status("res://assets/icons/correct.png")
			$Timer.start()
	if level == 4:
		if seleccionados == 1:
			x.set_status("res://assets/icons/correct.png")
		elif seleccionados == 2:
			x.set_status("res://assets/icons/correct.png")
		elif seleccionados == 3:
			x.set_status("res://assets/icons/correct.png")
		elif seleccionados == 4:
			if eleccion_correcta == true and eleccion_correcta2 == true and eleccion_correcta3 == true:
				score_level += 1
				score_total += 1
			$TopPanel.update_score(score_total)
			x.set_status("res://assets/icons/correct.png")
			$Timer.start()
	
func incorrect(x):
	if level == 1:
		if seleccionados == 1:
			x.set_status("res://assets/icons/incorrect.png")
		elif seleccionados == 2:
			x.set_status("res://assets/icons/incorrect.png")
			$Timer.start()
	if level == 2:
		if seleccionados == 1:
			x.set_status("res://assets/icons/incorrect.png")
		elif seleccionados == 2:
			x.set_status("res://assets/icons/incorrect.png")
			$Timer.start()
	if level == 3:
		if seleccionados == 1:
			x.set_status("res://assets/icons/incorrect.png")
		elif seleccionados == 2:
			x.set_status("res://assets/icons/incorrect.png")
		elif seleccionados == 3:
			x.set_status("res://assets/icons/incorrect.png")
			$Timer.start()
	if level == 4:
		if seleccionados == 1:
			x.set_status("res://assets/icons/incorrect.png")
		elif seleccionados == 2:
			x.set_status("res://assets/icons/incorrect.png")
		elif seleccionados == 3:
			x.set_status("res://assets/icons/incorrect.png")
		elif seleccionados == 4:
			x.set_status("res://assets/icons/incorrect.png")
			$Timer.start()

# Timer
func _on_Timer_timeout():
	time_left -=1
	if time_left <= 0:
		if intentos_level <= 2:
			next()
		else:
			$TopPanel/Margin1/ToMenu.disabled = false
			$PopUp.visible = false
			$PopUp.reset_nextlevel()
			next_level(score_level, score_total, level+1)

func next():
	# Timer
	$Timer.stop()
	# Containers
	$ObjectsOptions.visible = false
	# Vars
	time_left = 2
	seleccionados = 0
	# Functions
	reset_containers()
	# Nivel 2
	eleccion_correcta = false
	eleccion_correcta2 = false
	eleccion_correcta3 = false
	if level == 1:
		$Main/VBox/HBox/VBox/HBox/Margin1/Panel1.set_slot_item(false)
		$Main/VBox/HBox/VBox/HBox/Margin2/Panel2.set_slot_item(false)
	if level == 2:
		$Main/VBox/HBox/VBox/HBox/Margin1/Panel1.set_slot_item(false)
		$Main/VBox/HBox/VBox/HBox/Margin2/Panel2.set_slot_item(false)
	if level == 3:
		$Main/VBox/HBox/VBox/HBox/Margin1/Panel1.set_slot_item(false)
		$Main/VBox/HBox/VBox/HBox/Margin2/Panel2.set_slot_item(false)
		$Main/VBox/HBox/VBox/HBox/Margin3/Panel3.set_slot_item(false)
	if level == 4:
		$Main/VBox/HBox/VBox/HBox/Margin1/Panel1.set_slot_item(false)
		$Main/VBox/HBox/VBox/HBox/Margin2/Panel2.set_slot_item(false)
		$Main/VBox/HBox/VBox/HBox/Margin3/Panel3.set_slot_item(false)
		$Main/VBox/HBox/VBox/HBox/Margin4/Panel4.set_slot_item(false)
	if intentos_level < 2:
		if level == 1:
			set_sounds(2)
			set_options(json, 0)
		if level == 2:
			set_sounds(2)
			set_options(json, 1)
		if level == 3:
			set_sounds(3)
			set_options(json, 0)
		if level == 4:
			set_sounds(4)
			set_options(json, 0)
	else:
		if score_level == 2:
			if level == 4:
				popup_status = 1
				$PopUp.update_info("FELICITACIONES HAS COMPLETADO\nTODOS LOS NIVELES\n\nPUNTAJE FINAL : "+str(score_total)+" de 8")
				$TopPanel/Margin1/ToMenu.disabled = true
				$PopUp.update_textures_aceptar("res://assets/buttons/nivels/finalizar-basic.png","res://assets/buttons/nivels/finalizar-press.png")
				$PopUp.set_final()
				$Main/VBox/HBox/Margin2/Escuchar.visible = false
				$PopUp.visible = true
			else:
				intentos_level += 1
				$Timer.start()
				$PopUp.update_info("FELICITACIONES SIGUE AVANZANDO")
				$TopPanel/Margin1/ToMenu.disabled = true
				$PopUp.set_nextlevel()
				$Main/VBox/HBox/Margin2/Escuchar.visible = false
				$PopUp.visible = true
		else:
			popup_status = 2
			$PopUp.update_info("SIGUELO INTENTANDO")
			$TopPanel/Margin1/ToMenu.disabled = true
			$PopUp.update_textures_aceptar("res://assets/buttons/nivels/reintentar-basic.png","res://assets/buttons/nivels/reintentar-press.png")
			$PopUp.update_textures_rechazar("res://assets/buttons/nivels/finalizar-basic.png","res://assets/buttons/nivels/finalizar-press.png")
			$Main/VBox/HBox/Margin2/Escuchar.visible = false
			$PopUp.visible = true

func reset_containers():
	for i in $ObjectsSounds.get_children():
		$ObjectsSounds.remove_child(i)
	for i in $ObjectsOptions.get_children():
		$ObjectsOptions.remove_child(i)

# TopPanel
func _on_ToMenu_pressed():
	popup_status = 1
	$PopUp.update_info("RECUERDA QUE AL REGRESAR AL\nMENU PRINCIPAL PERDERAS TU\nPROGRESO")
	$PopUp.update_textures_aceptar("res://assets/buttons/nivels/si-basic.png","res://assets/buttons/nivels/si-press.png")
	$PopUp.update_textures_rechazar("res://assets/buttons/nivels/no-basic.png","res://assets/buttons/nivels/no-press.png")
	$PopUp.visible = true

# PopUp
func _on_Aceptar_pressed():
	if popup_status == 1:
		$PopUp.visible = false
		$Transition.visible = true
		$Transition/AnimationPlayer.play("fade-in")
		yield($Transition/AnimationPlayer, "animation_finished")
		get_tree().change_scene("res://title-screen/TitleScreen.tscn")
	if popup_status == 2:
		reintentar()
		$TopPanel/Margin1/ToMenu.disabled = false
		$Main/VBox/HBox/Margin2/Escuchar.visible = true
		$PopUp.visible = false

func _on_Rechazar_pressed():
	if popup_status == 1:
		$PopUp.visible = false
	if popup_status == 2:
		$PopUp.visible = false
		$Transition.visible = true
		$Transition/AnimationPlayer.play("fade-in")
		yield($Transition/AnimationPlayer, "animation_finished")
		get_tree().change_scene("res://title-screen/TitleScreen.tscn")

func next_level(s,t,l):
	if l == 2:
		# Panels
		$Main/VBox/HBox/VBox/HBox/Margin1.visible = true
		$Main/VBox/HBox/VBox/HBox/Margin2.visible = true
		$Main/VBox/HBox/VBox/HBox/Margin3.visible = false
		$Main/VBox/HBox/VBox/HBox/Margin4.visible = false
		$Main.update_indicaciones("\n\nORDENA LAS IMAGENES SEGUN LO ESCUCHADO.")
	if l == 3:
		# Panels
		$Main/VBox/HBox/VBox/HBox/Margin1.visible = true
		$Main/VBox/HBox/VBox/HBox/Margin2.visible = true
		$Main/VBox/HBox/VBox/HBox/Margin3.visible = true
		$Main/VBox/HBox/VBox/HBox/Margin4.visible = false
		$Main.update_indicaciones("\n\nORDENA LAS IMAGENES SEGUN LO ESCUCHADO.")
	if l == 4:
		# Panels
		$Main/VBox/HBox/VBox/HBox/Margin1.visible = true
		$Main/VBox/HBox/VBox/HBox/Margin2.visible = true
		$Main/VBox/HBox/VBox/HBox/Margin3.visible = true
		$Main/VBox/HBox/VBox/HBox/Margin4.visible = true
		$Main.update_indicaciones("\n\nORDENA LAS IMAGENES SEGUN LO ESCUCHADO.")
	$Main/VBox/HBox/Margin2/Escuchar.visible = true
	# Timer
	$Timer.stop()
	# Containers
	$ObjectsOptions.visible = false
	# Vars
	seleccionados = 0
	intentos_level = 0
	level = l
	score_level = 0
	score_user = t
	score_total = score_user
	time_left = 2
	#popup_status = 0
	eleccion_correcta = false
	eleccion_correcta2 = false
	eleccion_correcta3 = false
	# Functions
	reset_containers()
	$TopPanel.update_level(level)
	json = read_json()
	set_objects(json)
	if level == 2:
		set_sounds(2)
		set_options(json, 1)
	if level == 3:
		set_sounds(3)
		set_options(json, 0)
	if level == 4:
		set_sounds(4)
		set_options(json, 0)

func reintentar():
	$TopPanel.update_score(score_user)
	$Main/VBox/HBox/Margin2/Escuchar.visible = true
	# Timer
	$Timer.stop()
	# Containers
	$ObjectsOptions.visible = false
	# Vars
	seleccionados = 0
	intentos_level = 0
	#level = 1
	score_level = 0
	#score_user = 0
	score_total = score_user
	time_left = 2
	#popup_status = 0
	eleccion_correcta = false
	eleccion_correcta2 = false
	eleccion_correcta3 = false
	# Functions
	reset_containers()
	json = read_json()
	set_objects(json)
	if level == 1:
		set_sounds(2)
		set_options(json, 0)
	if level == 2:
		set_sounds(2)
		set_options(json, 1)
	if level == 3:
		set_sounds(3)
		set_options(json, 0)
	if level == 4:
		set_sounds(4)
		set_options(json, 0)