[ch (id=whitespace_handling) [title Whitespace Handling]

    PML uses whitespace handling rules that aim to be intuitive and practical. It is important to be aware of these rules, because ignoring them can lead to surprising or unwanted results, especially in edge cases.

    As there is no standard and unique definition for [i whitespace], we first need to define some terms used in the context of PML:
    [list

        [el [header Whitespace character]

            There are four [i whitespace characters]:
            [table_data
                Name, C-style syntax, Unicode
                -
                Space, ' ', U+0020
                Tab, '\t', U+0009
                Carriage return, '\r', U+000D
                Line feed, '\n', U+000A
            table_data]
            [nl]
        ]

        [el [header Whitespace]
            The term [i whitespace] is used to denote any sequence of one or more [i whitespace characters]. For example: 4 spaces, followed by two tabs and a new line.
        ]

        [el [header New line]

            New lines are defined differently in Unix and Windows. Unix uses a single [c line feed] (LF). Windows uses a [c carriage return], followed by a [c line feed] (CRLF).

            New line rules in PML depend on whether PML is reading or writing text.

            When PML [i reads] text, it supports both new line variations (LF and/or CRLF) correctly on Unix and Windows systems, even if a single document uses a mixture of Unix/Windows new lines.

            When PML [i writes] text (e.g. a HTML file) it uses the operating system's canonical new line (CRLF on Windows, LF on Unix).
        ]
    ]

    Whitespace is handled differently in nodes and attributes, as explained in the following chapters.

    [ch (id=nodes_whitespace) [title Nodes]

        Whitespace in nodes is handled as follows:

        [list

            [el [header Whitespace reduction]

                Whitespace in text is replaced by a single space character.

                Writing
                [code
                    this     is
                    text
                code]
                ... is the same as:
                [code
                    this is text
                code]

                To preserve a sequence of several whitespace characters, the node [link url=https://www.pml-lang.dev/docs/reference_manual/index.html#node_sp text=sp] can be used to explicitly insert non-breaking spaces, and the node [link url=https://www.pml-lang.dev/docs/reference_manual/index.html#node_nl text=nl] can be used to explicitly insert new lines, e.g.:
                [code
                    this[sp][sp][sp][sp][sp]is[nl]text
                code]
                ... is rendered as:
                [code
                    this     is
                    text
                code]

                Moreover, the [link url=https://www.pml-lang.dev/docs/reference_manual/index.html#node_monospace text=monospace] node can be used to insert a block of text in which whitespace is preserved (similar to the [c pre] tag in HTML):
                [code
                    [monospace
                    this     is
                    text
                    ]
                code]
            ]

            [el [header Paragraph breaks]

                A sequence of two consecutive new lines generates a paragraph break.

                Writing:
                [code
                    Paragraph 1.

                    Paragraph 2.
                code]
                ... is the same as:
                [code
                    [p Paragraph 1.]
                    [p Paragraph 2.]
                code]
                ... and is rendered as:
                [code
                    Paragraph 1.

                    Paragraph 2.
                code]

                However, writing:
                [code
                    Paragraph 1.
                    Paragraph 2.
                code]
                ... would be the same as
                [code
                    [p Paragraph 1. Paragraph 2.]
                code]
                ... and is rendered as:
                [code
                    Paragraph 1. Paragraph 2.
                code]
            ]

            [el [header Whitespace removal]

                [list
                    [el Leading and trailing whitespace in an auto-generated paragraph is removed.]
                    [el An auto-generated paragraph containing only whitespace is removed.]
                ]
            ]

            [el [header Whitespace does not define structure]

                Adding or removing whitespace characters in a whitespace segment does not alter a document's structure. Hence, whitespace can be used freely to make documents more readable or visually more appealing.

                For example, instead of writing:
                [code
                    [doc [title Doc Title]
                    [ch [title Chapter 1] text]
                    [ch [title Chapter 2] text]
                    ]
                code]
                ... we can make the structure easier to grasp like this:
                [code
                    [doc [title Doc Title]

                        [ch [title Chapter 1]
                            text
                        ]

                        [ch [title Chapter 2]
                            text
                        ]
                    ]
                code]

[-
                Whitespace can also be used to make long lists of attributes more readable. For example, instead of writing:
                [code
                    [image(source=images/ball.png width=500 height=500)]
                code]
                ... we can improve readability by writing:
                [code
                    [image (
                        source = images/ball.png
                        width = 500
                        height = 500
                    ) ]
                code]
-]
            ]
        ]
    ]

    [ch (id=attributes_whitespace) [title Attributes]

        Whitespace in attributes is handled as follows:

        [list
            [el [header Whitespace elimination]

                Whitespace around attribute symbols ([c() (], [c )], and [c =]) is ignored. The following three [c image] nodes are semantically equivalent:
                [code
                    [image ( source = "images/juicy apple.png" width = "400" height = "200" ) ]

                    [image(source="images/juicy apple.png" width=400 height=200)]

                    [image (
                        source = "images/juicy apple.png"
                         width = 400
                        height = 200
                    ) ]
                code]
            ]

            [el [header Whitespace in attribute values]

                As [xref node_id=omit_attribute_quotes text="stated already"], [i unquoted] attribute values cannot contain whitespace. Instead of writing [c color = light orange], we must write [c color = "light orange"]

                On the other hand, [i quoted] attribute values can contain whitespace (any sequences of spaces, tabs, and new lines). Whitespace within a [i quoted] value is preserved.

                Suppose we want to assign the following value to attribute [c quote]:
                [code
                    He said:
                       "She said: 'Wow!'"
                code]
                This can be achieved with:
                [code
                    quote = "He said:
                       \"She said: 'Wow!'\""
                code]
                Unix and Windows new lines are supported in attribute values.

                Unix or Windows new lines can be [i enforced] by using escape sequences. For example, to force Windows new lines in the above example, we can write:
                [code
                    quote = "He said:\r\n   \"She said: 'Wow!'\""
                code]
            ]
        ]
    ]
]