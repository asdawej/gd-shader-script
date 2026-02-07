@tool class_name GDSSTranslator
## 将GDSS翻译为Godot着色语言的工具类。


static func translate(gdss_code: String) -> String:
    var lexer := GDSSLexer.new(gdss_code)
    var lexer_ret := lexer.lex()
    var parser := GDSSParser.new(lexer_ret)
    var ast_nodes := parser.parse()
    
    return ''
