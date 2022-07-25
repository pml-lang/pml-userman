[ch (id=file_splitting) [title File Splitting]

    If you create a big document, it is useful to split it up into several files, instead of having one big file that contains all the text. For example, each chapter could be defined in a separate [c pml] file.

    The syntax to insert a [c pml] file at the current location is:

    [code
        [u:ins_file path = file_path]
    code]

    [c file_path] can be an absolute or relative path. If it's a relative path, it's relative to the directory of the [c pml] file in which [c ins_file] is used.

    [b Example]

    Suppose we create a PML document composed of two chapters. We want each chapter to be defined in its own file, in sub-directory [c chapters] (relative to the main document).

    [list
        [el [header PML code:]

            We create file [c chapters/chapter_1.pml] with this content:
            [code
                [ch [title Chapter 1]
                    blah blah blah
                ]
            code]

            We also create file [c chapters/chapter_2.pml]:
            [code
                [ch [title Chapter 2]
                    blah blah blah
                ]
            code]

            The main file [c book.pml] is defined like this:

            [code
                [doc [title Book]
                    [u:ins_file path = chapters/chapter_1.pml]
                    [u:ins_file path = chapters/chapter_2.pml]
                ]
            code]
        ]

        [el [header Result:]
            [image source=[u:get images_dir]/insert_example.png]
        ]
    ]

]
