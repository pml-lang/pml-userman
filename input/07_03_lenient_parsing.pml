[ch (id=lenient_parsing) [title Lenient Parsing]

    The following rules are applied to make the syntax more concise:

    [list

        [el
            If a formal node has only attributes (no child nodes) the parenthesis around attributes can be omitted.

            For example, the [c image] node has no child nodes. Therefore, instead of writing:
            [code
                [image ( source="images/juicy apple.png" width="400" ) ]
                       ^                                             ^
            code]
            ... we can also write:
            [code
                [image source="images/juicy apple.png" width="400" ]
            code]
        ]

        [el (id=omit_attribute_quotes)
            Quotes around attribute values can be omitted if the value does not contain:
            [list
                [el whitespace (a space, tab, carriage return or line feed)]
                [el any of the following characters: [c \[ \] ( ) " ']]
            ]

            Hence, instead of writing:
            [code
                width="400"
                      ^   ^
            code]
            ... we can write:
            [code
                width=400
            code]
        ]

[-
        [el
            Some nodes have a [i default] attribute. In that case, the attribute's name doesn't need to be specified, but only if it's the first attribute in the list of attribute assignments.

            For example, the default attribute for node [c image] is [c source]. Therefore, instead of writing:
            [code
                [image ( source="images/juicy apple.png" width="400" ) ]
                         ^^^^^^^
            code]
            ... we can write:
            [code
                [image ( "images/juicy apple.png" width="400" ) ]
            code]
        ]
-]

        [el
            If a node in a PML document has no attributes, it is not necessary to explicitly state the absence of attributes by writing [c() ()].
            Hence, the following code:
            [code
                [div () text]
                     ^^
            code]
            ... can be shortened to
            [code
                [div text]
            code]

            However, if the node's text starts with [c() (], then [c() ()] is required.

            Say we want to render the text: [i() (organic = healthy)]. In that case we can't write:
            [code
                [i (organic = healthy)]
            code]
            ... because the parser would interpret this as an attribute assignment (i.e. the value [c healthy] assigned to attribute [c organic].

            To eliminate the confusion we have to write:
            [code
                [i() (organic = healthy)]
                  ^^
            code]
        ]
    ]

    If we apply all above rules, then this code:
    [code
        [image ( source = "images/juicy apple.png" width = "400" ) ]
    code]
    ... can be shortened to:
[-
    [code
        [image "images/juicy apple.png" width=400]
    code]
-]
    [code
        [image source="images/juicy apple.png" width=400]
    code]
]

