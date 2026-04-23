extends CanvasLayer

var mainDialog = []

var _1_1 = [
	["guy1", "Goodmorning mate!"],
	["guy1", "Hope ya days've been pretty swell!"],
	["guy1", "Just wanted to ask ya a quick inquiry,"],
	["guy1", "Do you want some candy?"],
	]

var _1_2 = [
	["guy1", "Here ya go!"],
	["guy1", "Enjoy!!!"],
	["guy1", "mwuhaha..."],
	["you", "i don't feel so good..."],
	["you", "zoiks!!!!"],
	["..", "....."],
	["..", "so uh..."],
	["..", "slightly important news"],
	["..", "YOU'RE DEAD"],
	["..", "YOU GOT MERKED"],
	["..", "SLIMED OUT"],
	["..", "STUPID STUPID STUPID STUPID STUPID STUPID STUPID ＳＴＵＰＩＤ　STUPID STUPID"],
	]
	
var _1_3 = [
	["guy1", "Aww come on!"],
	["guy1", "Just one!!!"],
	["guy1", "What's the worst that can happen??"],
	]
var _1_4 = [
	["guy1", "Rats!!!!"],
	
	]

var buttonTable = [ #[Option 1, 2?]
	["Sure", "No thanks"],
	["I guess so", "NO!!"]
	
]

var masterTable = [ #[Dialog, Buttons to do after dialog, skips dialog]
	[_1_1, buttonTable[0], true],
	[_1_2, buttonTable[1], false],
	[_1_3, buttonTable[1], false],
	[_1_4, buttonTable[1], false],
	
]



@onready var textLabel: Label = $TextBox/Text
@onready var nameLabel: Label = $TextBox/Name
@onready var buttons = [$"Buttons/1", $"Buttons/2"]



var curIndex = 0
var masterIndex = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mainDialog.append_array(_1_1)
	nameLabel.text = mainDialog[curIndex][0]
	textLabel.text = mainDialog[curIndex][1]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("Next"):
		next()


func master():
	pass



func next():
	if curIndex < mainDialog.size() - 1:
		#print(curIndex)
		curIndex += 1
	else:
		if masterIndex < masterTable.size():
			if masterIndex == masterTable.size() - 1:
				end()
			else:
				toggleButtons(true)

		
			
		
		pass
	nameLabel.text = mainDialog[curIndex][0]
	textLabel.text = mainDialog[curIndex][1]
	
	
	if mainDialog[curIndex][1].contains("YOU'RE DEAD"):
		$Img/TextureRect5.visible = true
		print("AA")

	if mainDialog[curIndex][1].contains("STUPID STUPID STUPID STUPID STUPID STUPID STUPID ＳＴＵＰＩＤ　STUPID STUPID"):
		await get_tree().create_timer(1).timeout
		get_tree().quit()
		JavaScriptBridge.eval("window.close()") 

func toggleButtons(toggle : bool):
	
	for i in buttons.size():
		
		buttons[i].text = masterTable[masterIndex][1][i]
		buttons[i].visible = toggle
		


func pressedButtons(num : int):
	if true:
		if num == 0:
			if masterIndex == 0: #1.1
				masterTable.remove_at(3)
				masterTable.remove_at(2)
				
				$Img/TextureRect4.visible = false
				$Img/TextureRect.visible = false
				$Img/TextureRect2.visible = false
				$Img/TextureRect3.visible = true
				
			if masterIndex == 2: #1.3
				masterIndex = 0
				masterTable.remove_at(3)
				masterTable.remove_at(2)
				
				$Img/TextureRect4.visible = false
				$Img/TextureRect.visible = false
				$Img/TextureRect2.visible = false
				$Img/TextureRect3.visible = true
				
				
		else:
			
			if masterIndex == 0: #1.1
				masterIndex = 1
				$Img/TextureRect4.visible = false
				$Img/TextureRect.visible = false
				$Img/TextureRect2.visible = true
				$Img/TextureRect3.visible = false
				
				
			if masterIndex == 2: #1.3
				masterIndex = 3
				$Img/TextureRect4.visible = true
				$Img/TextureRect.visible = false
				$Img/TextureRect2.visible = false
				$Img/TextureRect3.visible = false
	
	
	if masterIndex < masterTable.size() - 1:
		masterIndex += 1
	if masterIndex < masterTable.size():
		mainDialog.append_array(masterTable[masterIndex][0])
		toggleButtons(false)
		next()

func _B1() -> void:
	pressedButtons(0)

func _B2() -> void:
	pressedButtons(1)

func _B3() -> void:
	pass # Replace with function body.


func end():
	print("A")
