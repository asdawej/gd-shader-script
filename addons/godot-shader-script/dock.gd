@tool extends Control


@onready var input_line_edit := %InputLineEdit as LineEdit
@onready var output_line_edit := %OutputLineEdit as LineEdit
@onready var input_file_dialog := %InputFileDialog as FileDialog
@onready var output_file_dialog := %OutputFileDialog as FileDialog

func _on_input_file_button_pressed() -> void:
	input_file_dialog.popup_file_dialog()

func _on_output_file_button_pressed() -> void:
	output_file_dialog.popup_file_dialog()

func _on_translate_button_pressed() -> void:
	var gdss_file_path := input_line_edit.text
	var gdshader_file_path: String
	if output_line_edit.text.is_empty():
		output_line_edit.text = gdss_file_path.get_basename() + '.gdshader'
	gdshader_file_path = output_line_edit.text
	var gdss_file := FileAccess.open(gdss_file_path, FileAccess.READ)
	var gdshader_file := FileAccess.open(gdshader_file_path, FileAccess.WRITE)
	GDSSTranslator.translate(gdss_file, gdshader_file)
	gdss_file.close()
	gdshader_file.close()

func _on_input_file_dialog_file_selected(path: String) -> void:
	input_line_edit.text = path

func _on_output_file_dialog_file_selected(path: String) -> void:
	output_line_edit.text = path
