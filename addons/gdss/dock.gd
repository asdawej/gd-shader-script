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
    var gdss_path := input_line_edit.text
    var gdshader_path: String
    if output_line_edit.text.is_empty():
        output_line_edit.text = gdss_path.get_basename() + '.gdshader'
    gdshader_path = output_line_edit.text
    var gdss_file := FileAccess.open(gdss_path, FileAccess.READ)
    var gdss_code := gdss_file.get_as_text()
    var gdshader_code := GDSSTranslator.translate(gdss_code)
    var shader := Shader.new()
    shader.code = gdshader_code
    ResourceSaver.save(shader, gdshader_path)

func _on_input_file_dialog_file_selected(path: String) -> void:
    input_line_edit.text = path

func _on_output_file_dialog_file_selected(path: String) -> void:
    output_line_edit.text = path
