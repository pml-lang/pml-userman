[ch [title Table of Contents]

    By default, a table of contents (TOC) is created on the left side of the HTML page, as shown [xref node_id=simple_document_example text=before].

    The TOC is automatically created based on the chapters defined in the document.
    As chapters can be nested, the TOC results in a tree, which the user can expand or collapse.
    When the document is first displayed, all TOC chapters beyond level 1 are collapsed.
    Only chapters of level 1 are displayed.
    The user can then expand chapters and sub-chapters, and click on a chapter's title to see its content.

    PML's default behavior for the TOC can be customized with the following options:
    [list
        [el [c TOC_title]: change or remove the title displayed at the top of the TOC]
        [el [c TOC_position]: define the TOC's position. Allowed values are:
            [list
                [el [c left]: Display the TOC at the left side. This is the default value.]
                [el [c top]: Display the TOC at the top of the document, after the document's title.]
                [el [c none]: Don't display a TOC.]
            ]
        ]
        [el [c TOC_max_level]: the maximum chapter level that is included in the table of contents. Chapters with a higher level are excluded from the TOC.]
    ]

    Here is an example of using an [xref node_id=options text=options] node to set the TOC's title to "Inhaltsverzeichnis", display the TOC at the top, and include only chapters up to level 4:


    [code
        [doc [title TOC test]

            [options
                [TOC_title Inhaltsverzeichnis]
                [TOC_position top]
                [TOC_max_level 4]
            ]

            lorem ipsum tralala ...
        ]
    code]
]
