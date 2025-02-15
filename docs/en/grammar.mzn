% A MiniZinc model
<model> ::= [ <item> ";" ... ]

% Items
<item>  ::= <include-item>
          | <var-decl-item>
          | <enum-item>
          | <type-inst-syn-item>
          | <assign-item>
          | <constraint-item> 
          | <solve-item>
          | <output-item>
          | <predicate-item>
          | <test-item>
          | <function-item>
          | <annotation-item>

<ti-expr-and-id> ::= <ti-expr> ":" <ident>

% Include items
<include-item> ::= "include" <string-literal>

% Variable declaration items
<var-decl-item> ::= <ti-expr-and-id> <annotations> [ "=" <expr> ]
                  | "any" ":" <ident> <annotations> [ "=" <expr> ]

% Enum items
<enum-item>  ::= "enum" <ident> <annotations> [ "=" <enum-cases-list> ]

<enum-cases-list> ::= <enum-cases>
                    | <enum-cases-list> "++" <enum-cases>

<enum-cases> ::= "{" <ident> "," ... "}"
               | "_" "(" <expr> ")"
               | <ident> "(" <ident> ")"
               | "anon_enum" "(" <expr> ")"

% Type-inst synonym items
<type-inst-syn-item> ::= "type" <ident> <annotations> "=" <ti-expr>

% Assign items
<assign-item> ::= <ident> "=" <expr>

% Constraint items
<constraint-item> ::= "constraint" [ <string-annotation> ] <expr>

% Solve item
<solve-item> ::= "solve" <annotations> "satisfy"
               | "solve" <annotations> "minimize" <expr>
               | "solve" <annotations> "maximize" <expr>

% Output items
<output-item> ::= "output" [ <string-annotation> ] <expr>

% Annotation items
<annotation-item> ::= "annotation" <ident> <params> [ "=" <expr> ]

% Predicate, test and function items
<predicate-item> ::= "predicate" <operation-item-tail>

<test-item> ::= "test" <operation-item-tail>

<function-item> ::= "function" <ti-expr> ":" <operation-item-tail>

<operation-item-tail> ::= <ident> <params> <annotations> [ "=" <expr> ]

<params> ::= [ ( <ti-expr-and-id> "," ... ) ]

% Type-inst expressions
<ti-expr> ::= <base-ti-expr>
            | <array-ti-expr>

<base-ti-expr> ::= <var-par> <opt-ti> <set-ti> <base-ti-expr-tail> ["++" <base-ti-expr>]
                 | "any" <ti-variable-expr-tail>

<var-par> ::= "var" | "par" | ε

<opt-ti> ::= "opt" | ε

<set-ti> ::= "set" "of" | ε

<base-type> ::= "bool"
              | "int"
              | "float"
              | "string"

<base-ti-expr-tail> ::= <ident>
                      | <base-type>
                      | <ti-variable-expr-tail>
                      | <tuple-ti-expr-tail>
                      | <record-ti-expr-tail>
                      | "ann"
                      | <expr>

% Type-inst variables
<ti-variable-expr-tail> ::= $[A-Za-z$][A-Za-z0-9_]*

% Array type-inst expressions
<array-ti-expr> ::= "array" [ <ti-expr> "," ... ] "of" <base-ti-expr>
                  | "list" "of" <base-ti-expr>

% Tuple type-inst expressions
<tuple-ti-expr-tail> ::= "tuple" ( <ti-expr> "," ... )

% Record type-inst expressions
<record-ti-expr-tail> ::= "record" ( <ti-expr-and-id> "," ... )

% Expressions
<expr> ::= <expr-atom> <expr-binop-tail>

<expr-atom> ::= <expr-atom-head> <expr-atom-tail> <annotations>

<expr-binop-tail> ::= [ <bin-op> <expr> ]

<expr-atom-head> ::= <builtin-un-op> <expr-atom>
                   | "(" <expr> ")"
                   | <ident-or-quoted-op>
                   | "_"
                   | <bool-literal>
                   | <int-literal>
                   | <float-literal>
                   | <string-literal>
                   | <set-literal>
                   | <set-comp>
                   | <array-literal>
                   | <array-literal-2d>
                   | <indexed-array-literal>
                   | <indexed-array-literal-2d>
                   | <tuple-literal>
                   | <record-literal>
                   | <array-comp>
                   | <indexed-array-comp>
                   | <ann-literal>
                   | <if-then-else-expr>
                   | <let-expr>
                   | <call-expr>
                   | <gen-call-expr>

<expr-atom-tail> ::= ε
                   | <array-access-tail> <expr-atom-tail>

% Numeric expressions
<num-expr> ::= <num-expr-atom> <num-expr-binop-tail>

<num-expr-atom> ::= <num-expr-atom-head> <expr-atom-tail> <annotations>

<num-expr-binop-tail> ::= [ <num-bin-op> <num-expr> ]

<num-expr-atom-head> ::= <builtin-num-un-op> <num-expr-atom>
                       | "(" <num-expr> ")"
                       | <ident-or-quoted-op>
                       | <int-literal>
                       | <float-literal>
                       | <if-then-else-expr>
                       | <let-expr>
                       | <call-expr>
                       | <gen-call-expr>

% Built-in operators
<builtin-op> ::= <builtin-bin-op> | <builtin-un-op>

<bin-op> ::= <builtin-bin-op> | ‘<ident>‘

<builtin-bin-op> ::= "<->" | "->" | "<-" | "\/" | "xor" | "/\"
                   | "<" | ">" | "<=" | ">=" | "==" | "=" | "!="
                   | "~=" | "~!="
                   | "in" | "subset" | "superset" | "union" | "diff" | "symdiff"
                   | ".." | "intersect" | "++" | "default" | <builtin-num-bin-op>

<builtin-un-op> ::= "not" | <builtin-num-un-op>

% Built-in numeric operators
<num-bin-op> ::= <builtin-num-bin-op> | ‘<ident>‘

<builtin-num-bin-op> ::= "+" | "-" | "*" | "/" | "div" | "mod" | "^"
                       | "~+" | "~-" | "~*" | "~/" | "~div"

<builtin-num-un-op> ::= "+" | "-"

% Boolean literals
<bool-literal> ::= "false" | "true"

% Integer literals
<int-literal> ::= [0-9]+
                | 0x[0-9A-Fa-f]+
                | 0o[0-7]+

% Float literals
<float-literal> ::= [0-9]+"."[0-9]+
                  | [0-9]+"."[0-9]+[Ee][-+]?[0-9]+
                  | [0-9]+[Ee][-+]?[0-9]+
                  | 0[xX]([0-9a-fA-F]*"."[0-9a-fA-F]+|[0-9a-fA-F]+".")([pP][+-]?[0-9]+)
                  | (0[xX][0-9a-fA-F]+[pP][+-]?[0-9]+)

% String literals
<string-contents> ::= ([^"\n\] |  \[0-7][0-7?][0-7]? | \x[0-9a-fA-F][0-9a-fA-F]? | \n | \t | \" | \\)*

<string-literal> ::= """ <string-contents> """
                   | """ <string-contents> "\(" <string-interpolate-tail>

<string-interpolate-tail> ::= <expr> ")"<string-contents>"""
                            | <expr> ")"<string-contents>"\(" <string-interpolate-tail>

% Set literals
<set-literal> ::= "{" [ <expr> "," ... ] "}"

% Set comprehensions
<set-comp> ::= "{" <expr> "|" <comp-tail> "}"

<comp-tail> ::= <generator> [ "where" <expr> ] "," ...

<generator> ::= ( <ident> | "_" ) "," ... "in" <expr>

% Array literals
<array-literal> ::= "[" [ <expr> "," ... ] "]"

% 2D Array literals
<array-literal-2d> ::= "[|" [ [ <expr> "," ... ] "|" ... ] "|]"

% Indexed 2D Array literals
<indexed-array-literal-2d> ::= "[|" [ <expr> ":" ... ] [ [ <expr> ":" ] <expr> "," ... ] "|]"

% Indexed array literals
<indexed-array-literal> ::= "[" [ ( <index-tuple> ":" <expr> ) "," ... ] "]"
                          | "[" [ <index-tuple> ":" <expr> "," <expr> "," ... ] "]"

<index-tuple> ::= <expr>
                | "(" [ <expr> "," ... ] ")"

% Tuple literals
<tuple-literal> ::= "(" <expr> "," [ <expr> "," ... ] ")"

% Record literals
<record-literal> ::= "(" <ident> ":" <expr> "," [ <ident> ":" <expr> "," ... ] ")"

% Array comprehensions
<array-comp> ::= "[" <expr> "|" <comp-tail> "]"

% Indexed array comprehensions
<indexed-array-comp> ::= "[" <index-tuple> ":" <expr> "|" <comp-tail> "]"

% Array access
<array-access-tail> ::= "[" <expr> "," ... "]"

% Annotation literals
<ann-literal> ::= <ident> [ "(" <expr> "," ... ")" ]

% If-then-else expressions
<if-then-else-expr> ::= "if" <expr> "then" <expr> [ "elseif" <expr> "then" <expr> ]* [ "else" <expr> ] "endif"

% Call expressions
<call-expr> ::= <ident-or-quoted-op> [ "(" <expr> "," ... ")" ]

% Let expressions
<let-expr> ::= "let" "{" <let-item> ";" ... "}" "in" <expr>

<let-item> ::= <var-decl-item>
             | <constraint-item>

% Generator call expressions
<gen-call-expr> ::= <ident-or-quoted-op> "(" <comp-tail> ")" "(" <expr> ")"

% Miscellaneous

% Identifiers
<ident> ::= _?[A-Za-z][A-Za-z0-9_]* | ’[^’\xa\xd\x0]+’

% Identifiers and quoted operators
<ident-or-quoted-op> ::= <ident>
                       | ’<builtin-op>’

% Annotations
<annotations> ::= [ "::" <annotation> ]*

<annotation> ::= <expr-atom-head> <expr-atom-tail>

<string-annotation> ::= "::" <string-literal>
