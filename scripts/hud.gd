extends Control

@onready var oxygen_bar = $StatusPanel/VBoxContainer/OxygenBar
@onready var oxygen_label =$StatusPanel/VBoxContainer/OxygenLabel
@onready var power_core_label = $StatusPanel/VBoxContainer/PowerCoreLabel
@onready var power_tool_label = $StatusPanel/VBoxContainer/PowerToolLabel
@onready var power_part_label = $StatusPanel/VBoxContainer/PowerPartLabel

func _process(_delta):
	oxygen_bar.value = GameManager.oxygen
	oxygen_label.text = "OXYGEN: %d%%" % GameManager.oxygen
	
	power_core_label.text = "Power Cores: %d / 7" % GameManager.power_cores
	power_tool_label.text = "Power Tools: %d / 3" % GameManager.power_tools
	power_part_label.text = "Power Parts: %d / 10" % GameManager.power_parts
	
	
