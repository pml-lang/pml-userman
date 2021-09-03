[ch [title Comments]

    A comment starts with [c \[-] and ends with [c -\]]. Comments can appear anywhere, and they can be nested to any level. Text within comments is ignored.

    Example:

    [list
        [el [header PML code:]
            [code
                This is [- good -] awesome.
                [- TODO: explain why -]

                Text
                [-
                    This [i bad] text not show.
                    [- a
                        nested
                        comment -]
                -]

                More text
            code]
        ]

        [el [header Result:]
            [code
                This is awesome.

                Text

                More text
            code]
        ]
    ]
]
