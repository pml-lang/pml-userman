[ch (id=customization) [title Customization]

    A major goal of PMLC is to give you full control over how PML documents are converted to HTML or other formats.
    [- While PMLC's default behavior has been designed to suit most use cases, you should be able to adjust or tweak it to your specific needs. -]
    Therefore PMLC provides several features allowing you to partially or fully customize the conversion process, so that the target document's look and feel honors your preferences and specific requirements.

    Customization is currently supported in the following ways:
    [list
        [el A set of options that can be specified at the command line, in the PML document, or in a shared options file.]
        [el HTML Attributes.]
        [el Customized CSS files to style the HTML document.]
        [el User-defined nodes that allow you to add new nodes to PML, or to override PML's standard nodes.]
    ]

    The following features are planned to be supported in future versions:
    [list
        [el HTML templates to easily customize HTML code generation for specific nodes.]
        [el Custom HTML node writers to programmatically generate specific HTML code for individual (or all) nodes.]
        [el Custom writers to programmatically convert PML documents into other formats, such as plain text, JSON, XML, PDF, etc.]
        [el AST interception to programmatically change the AST produced by the PML parser (i.e. change, add, and remove PML nodes and attributes).]
    ]

    [ch (id=options) [title Options]

        To see the list of options available when a PML document is converted to HTML, please refer to section "Input Parameters" in chapter [link url=[u:get pml_website]/docs/commands_manual/index.html#command_PML_to_HTML text = "Convert PML to HTML"] of the [link url=[u:get pml_website]/docs/commands_manual/index.html text = "PMLC Commands Reference Manual"].

        When PMLC executes command [c PML_to_HTML], it looks for options in the following order:
        [list (html_style="list-style-type:decimal")

            [el
                If the value for an option is explicitly specified as a command line argument, then this value is applied.
                Options defined on the command line always have highest priority.

                For example, the title and position for the table of contents can be explicitly defined on the command line like this:
                [input
                    --TOC_title "Book Content" --TOC_position top
                input]
            ]

            [el
                If no value is specified on the command line, then PMLC looks for a value specified within an [c options] node in the PML document.
                If a value is found then this value is applied.

                The [c options] node must be defined as a direct child node of the [c doc] node.

                For example, the title and position for the table of contents can be defined in the PML document as follows:
                [code
                    ~~~
                    [doc [title Options Example]

                        [options
                            [TOC_title Book Content]
                            [TOC_position top]
                        ]

                        text ...
                    ]
                    ~~~
                ]
            ]

            [el
                If a value is neither specified on the command line nor in the PML document, then PMLC looks for a value specified in a shared options file.

                The relative path of this file is [c config/PML_to_HTML/options.pdml].
                The file's root directory depends on the operating system. For example, on Windows it is normally a subdirectory of [c %APPDATA%].
                To know the exact location on your machine, you can run command [c pmlc info] in a terminal.
                Then look for the field labeled [c Shared data dir.], which shows the root directory.
                A typical value on Windows would be [c C:\\Users\\Albert\\AppData\\Roaming\\PMLC_3.0\\].
                In this case the full path of the options file would be[nl]
                [c C:\\Users\\Albert\\AppData\\Roaming\\PMLC_3.0\\config\\PML_to_HTML\\options.pdml]

                Note that file [c config/PML_to_HTML/options.pdml] is itself optional.
                If it doesn't exist, you need to create it manually to store shared options.

                If the file exists, and a value is found for an option, then this value is applied.

                The content of the file is the same as the [c options] node in a PML document.

                For example, the default title and position for the table of contents can be defined as follows:
                [caption File [c config/PML_to_HTML/options.pdml]]
                [code
                    ~~~
                    [options
                        [TOC_title Book Content]
                        [TOC_position top]
                    ]
                    ~~~
                ]

                [admon (label=Tip)
                    You should consider using the [c options.pdml] file for options that are needed in most or all of your PML documents.
                    Defining options in the shared [c options.pdml] file eliminates the need to repeat the same options again and again in different PML documents or as command arguments.
                ]
            ]

            [el
                If a value is neither specified on the command line, nor in the PML document, nor in a shared options file, then PMLC applies a hard-coded default value.
            ]
        ]

        [note
            The following options are only available as command line arguments. They cannot be used in a PML document or in a shared options file:[nl]
            [c input, output, verbosity, open_file_cmd]
        ]
    ]

    [ch (id=HTML_attributes_2) [title HTML Attributes]

        If you want to change the style of a [i single] node, you can define an [i HTML attribute] for that node, as explained [xref node_id=HTML_attributes text=previously].
        You can assign any valid [link url=https://www.w3schools.com/css/ text=CSS] to the node's [c html_style] attribute, or you can use an [c html_class] attribute.

        Besides customizing CSS, [i HTML attributes] defined for a PML node can also be used to set other HTML attributes in the target HTML document.

        Please refer to chapter [xref node_id=HTML_attributes] for more information.
    ]

    [ch (id=customized_css) [title Customized CSS]

        Option [c CSS_files] can be used to specify one or more customized CSS files to be applied in the final HTML document.
        For more information, please refer to parameter [c CSS_files] in section "Input Parameters" of chapter [link url=[u:get pml_website]/docs/commands_manual/index.html#command_PML_to_HTML text = "Convert PML to HTML"].

        Each tag in the final HTML document has a [c class] attribute.
        Hence, the [c class] value can be used in any CSS file to style the HTML node.
        All CSS class names used in PML are prefixed with [c pml-], so that PML styling doesn't interfere with other styling rules that might exist in the final HTML page.

        For example, the document title's class is [c pml-doc-title].
        Hence, to change the appearance (font, size, color, etc.) of the document's title, you can apply any CSS rule to class [c pml-doc-title] in a CSS file.

        If you want to change the style just for an [i individual] node, you can use the [c html_style] attribute, as [xref node_id=HTML_attributes text="seen already"]. Alternatively, you can define an [i identifier] for the node, and then use the identifier in the CSS file to change the style.

        For example, to display a single paragraph with a yellow background, you would write the following PML code:
        [code
            [p (id = my-id)
                This text is displayed on a yellow background.
            ]
        code]
        Then you can add the following rule in a CSS file:
        [code
            #my-id {
                background-color: yellow;
            }
        code]
        Result:
        [p (html_style="background-color: yellow;")
            This text is displayed on a yellow background.
        ]
    ]

    [ch (id=user_defined_nodes) [title User-Defined Nodes]

        Please refer to chapter [link url=[u:get pml_website]/docs/advanced_features/index.html#user_defined_nodes text = "User-Defined Nodes"] for more information.
    ]
]
