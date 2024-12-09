  ; highlights.scm

function_keyword: (function_keyword) @keyword.function

(function_definition
function_name: (identifier) @function
(end) @keyword.function)
function_name: (identifier) @function.call
; (function_definition end: (end) @keyword.function) ; not needed because we defined above already

(parameter_list (identifier) @parameter)


(if_statement
  "if" @keyword.conditional)

(if_statement (end) @keyword.conditional)

(switch_statement
  "switch" @keyword.conditional)

(switch_statement (end) @keyword.conditional)

[
    "elseif"
    "else"
    "case"
    "otherwise"
] @keyword.conditional


(for_statement ["for" @keyword.repeat])
; (for_statement (pattern) @variable)
(for_statement (end) @keyword.repeat)
(while_statement ["while" @keyword.repeat])
(while_statement (end) @keyword.repeat)

["try" "catch"] @keyword.exception
(try_statement (end) @keyword.exception)


["return" "break" "continue"] @keyword.return



;;;; Classdef
[
    "classdef"
    "properties"
    "methods"
    "enumeration"
    "events"
    endmethods: (end)
    endclass: (end)
    endproperties: (end)
    endevents: (end)
    endenum: (end)
] @keyword

(class_definition classname: (identifier) @type)
superclass: [(struct (identifier)) (identifier)] @type

(class_definition ["&"
                   "<"] @character)

"@" @character

(
(identifier) @constant.builtin
(#any-of? @constant.builtin "true" "false")
)

(
    (identifier) @constant.builtin
    (#eq? @constant.builtin "end")
)

;; Punctuations

[";" "," "." ":"] @punctuation.delimiter

; ;; Brackets
[
 "("
 ")"
 "["
 "]"
 "{"
 "}"
] @punctuation.bracket

;; Operators
"=" @operator
(operation [">"
            "<"
            "=="
            "<="
            ">="
            "=<"
            "=>"
            "~="
            "*"
            ".*"
            "./"
            "/"
            "\\"
            "^"
            ".^"
            "+"] @operator)

;; boolean operator
[
    "&&"
    "||"
] @operator

;; Number
(number) @number

;; String
(string) @string
(string) @spell

;; Comment


;; Comment
(comment "%") @comment
; ((comment) @spell)    ; we decided we do not want spellchecking in comments
