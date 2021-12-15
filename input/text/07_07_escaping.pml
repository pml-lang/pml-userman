[ch (id=escape_characters) [title Escape Characters]

    Character escape rules in [i node text] and [i attribute values] are slightly different, as explained in the following chapters.

    [ch [title Nodes]

        As seen already, characters [c \[] and [c \]] define the start and end of a node.

        Therefore, if these characters are used in text, they must be escaped, to avoid confusion. This is done by prefixing the character with a backslash ([c \\]). For instance, instead of writing [c \[], we have to write [c \\\[].

        As a backslash is used as escape character, it must itself also be escaped when it is used in text. Hence, instead of writing [c \\], we have to write [c \\\\].

        Here is an example to demonstrate how escaping works:

        [list
            [el [header PML code:]
                [code
                    File path = C:\\tests\\example.txt

                    Instead of writing \\, we have to write \\\\

                    Instead of writing \[, we have to write \\\[
                code]
            ]

            [el [header Result:]
                File path = C:\\tests\\example.txt

                Instead of writing \\, we have to write \\\\

                Instead of writing \[, we have to write \\\[
            ]
        ]

        The final rule is simple: Characters [c \[], [c \]], and [c \\] must be preceded by [c \\] when they are used in normal text.

        Besides characters that [i must] be escaped, there are also characters that [i can] be escaped if desired, as shown in the following table:
        [table_data
            Character or name, Escape sequence, Mandatory
            -
            \, \\, yes
            [, \[, yes
            ], \], yes
            Tab, \t, no
            Carriage return, \r, no
            Line feed, \n, no
            Unicode escape 4 hex digits, \uhhhh (e.g. \u2764 for "heart shape": ♥), no
            Unicode escape 8 hex digits, \Uhhhhhhhh (e.g. \U0001F600 for "grinning face": 😀), no
        table_data]
    ]

    [ch [title Attributes]

        Escape sequences are not supported in [i un]quoted attribute values.

        If an attribute value is quoted, the following escape sequences are supported:
        [table_data
            Character or name, Escape sequence, Mandatory
            -
            ", \", yes
            \, \\, yes
            [, \[, no
            ], \], no
            Tab, \t, no
            Carriage return, \r, no
            Line feed, \n, no
            Unicode escape 4 hex digits, \uhhhh (e.g. \u2764 for "heart shape": ♥), no
            Unicode escape 8 hex digits, \Uhhhhhhhh (e.g. \U0001F600 for "grinning face": 😀), no
        table_data]

        Example: Suppose we want to assign the value [c C:\\temp\\test.txt] to attribute [c path]. In this case the value can be quoted or unquoted. If the value is quoted then [c \\] must be escaped:
        [table_data (halign="R,L")
            Quoted:, path = "C:\\temp\\test.txt"
            Unquoted:, path = C:\temp\test.txt
        table_data]
    ]
]
