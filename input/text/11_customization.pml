[ch [title Customization]

    The style (look) of the final HTML document can be customized.
    For example, you might want to display warnings in red letters.
    Or you might want to change the amount of space between lines in the whole document.

    There are different ways to customize the style, as explained in the following chapters.

    [ch [title HTML Attributes]

        If you want to change the style (or other HTML attributes) of a [i single] node, you can define an [i HTML style attribute] for that node, as explained [xref node_id=HTML_attributes text=previously].
        You can assign any valid [link url=https://www.w3schools.com/css/ text=CSS] to the node's [c html_style] attribute.
        Please refer to chapter [xref node_id=HTML_attributes] for more information.
    ]

    [ch [title CSS]

        The final HTML document is styled by standard [link url=https://www.w3schools.com/css/ text=CSS].

        The CSS code is defined in file [c pml-default.css], which is copied from PML's installation directory into directory [c output/css/] each time the target HTML file is created.
        Thus, if file [c example.pml] is converted to HTML, file [c output/example.html], as well as file [c output/css/pml-default.css] are created.

        [note There is also a file named [c output/css/pml-print-default.css]. This file contains specific CSS applied when the document is printed.]

        To change the style, you can modify file [c pml-default.css] or replace it with your own version.
        You can use the full power of CSS to change the look of your document.

        [note
            At the moment, only one style sheet is delivered with PML, and the name of the CSS file is hard-coded.

            Moreover, the CSS file is overwritten each time the HTML document is generated.
            You need to be aware of this if you want to change the CSS code.
            You could use an OS script file to automate the replacement of the CSS file.

            Future PML versions will provide more flexibility. There will be a command line argument to explicitly specify the location of the CSS file(s).
        ]

        Each HTML node in the final HTML document has a [c class] attribute.
        The value of this attribute is used in the CSS file to style the HTML node.
        All CSS class names used in PML are prefixed with [c pml-], so that PML styling doesn't interfere with other styling rules that might exist in the final HTML page.
        For example, the document title's class is [c pml-doc-title].
        Hence, by modifying class [c pml-doc-title] in the CSS file, you can change the appearance (font, size, color, etc.) of the document's title.

        If you want to change the style of a node, you need to know the class name used for styling.
        There are two ways to find out the class name.
        [list
            [el
                You can open the target HTML document in your preferred editor and search the HTML code, to find out the class name used to style the HTML.

                You can also use your browser's inspector (typically available under the menu 'Developer tools') to inspect the node and see the class name and CSS code.
            ]
            [el
                You can use the [link url=[!get pml_website]/docs/reference_manual/index.html text = "PML Reference Manual"] to find out which class name is used.

                Suppose you want to change the color of the document's title. You could proceed like this:
                [list
                    [el
                        Goto chapter [link url=[!get pml_website]/docs/reference_manual/index.html#node_doc text = Document] in the [i PML Reference Manual] and look at the example at the end of the chapter.
                    ]
                    [el
                        In the [i HTML code generated], you can spot the line:
                        [code
                            <h1 class="pml-doc-title">A Nice Surprise</h1>
                        code]
                        So, now you know that the class name is [c pml-doc-title].
                    ]
                    [el
                        You can now open the CSS file [c pml-default.css], search for [c pml-doc-title], and change the class.
                        For example, to display the title in blue, you can add a line at the end of the class definition. The result could look like this:
                        [code
                            .pml-doc-title {
                                font-size: 2.2em;
                                margin-top: 0.2em;
                                color: blue;
                            }
                        code]
                    ]
                ]
            ]
        ]

        If you want to change the style just for an [i individual] node, you can use the [c html_style] attribute, as [xref node_id=HTML_attributes text="seen already"]. Alternatively, you can define an [i identifier] for the node, and then use the identifier in the CSS file to change the style.

        For example, to display a single paragraph with a yellow background, you would write the following PML code:
        [code
            [p (id = my-id)
                This text is displayed on a yellow background.
            ]
        code]
        Then you can add a rule in the CSS file, as follows:
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

[-
    [ch [title Future]
        To provide a maximum of customization, more features will be added in future versions. For example, it will be possible to programmatically add new types of nodes, and specify how they are rendered.
        [-
            block node
            inline node
            templates
            overwriting standard formal nodes programmatically
            adding new formal nodes programmatically
        -]
    ]
-]
]
