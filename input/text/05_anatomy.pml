[ch [title Anatomy of a PML Document]

    [ch [title Document Tree]

        A PML document is a tree composed of PML nodes.

        Here is a visual representation of the tree structure of a simple PML document:

        [u:ins_file path = 03_01_document_tree_example.pml]

        The above document has two chapters. The first chapter is composed of a title and three paragraphs. The second chapter contains a title, a paragraph, and an image.

        A real document having the above structure would look like this:

        [header File example.pml]
        [insert_code file = [!get examples_dir]/simple_document/03_01_document_example.pml]

        File [c example.pml] can be converted to file [c output/example.html] with the following command:

        [input
            pmlc example.pml
        input]

        [note The above PML document uses image file [c images/strawberries.jpg]. By default, all resources used in a document are located in directory [c resources]. Therefore file [c resources/images/strawberries.jpg] must exist before executing the above command.]

        Now file [c output/example.html] can be opened in the browser, and the result looks like this:

        [image source = [!get images_dir]/03_01_document_example.png border=yes id=simple_document_example]
    ]

    [ch [title Nodes]

        There are different [i types] of nodes in a document tree.

        A node's type is determined by a [i tag]. For example:
        [list
            [el A [i chapter] node has the tag [c ch], and represents a chapter of an article or book.]
            [el An [c image] node represents an image to be inserted in the document.]
            [el An [c italic] node is used to write text in [i italics].]
        ]

        Every node in a document starts with a [c \[] and ends with a [c \]]. The node's tag is written immediately after the opening [c \[], without a space (e.g. [c \[doc ... \]] or [c \[ch ... \]]).

        A node can be empty, contain only text, or contain a mixture of text and child nodes.
        A node's tag and its content are separated by a space.
        Here are three examples:

        [code
            [nl]
            [i node containing only text displayed in italics]
            [p A [i simple] paragraph with [b six] words.]
        code]

        The full list of nodes is documented in the [link url=[!get pml_website]/docs/reference_manual/index.html text = "PML Reference Manual"].
    ]

    [ch [title Attributes]

        Some nodes have attributes.

        Some attributes are required, and some are optional.

        For example, the [c image] node has a [i required] attribute named [c source], which defines the image's file path.
        Moreover it has some [i optional] attributes, such as [c width] and [c height], to explicitly define the image's dimensions in pixels.
        Here is an example of an [c image] node with values assigned to attributes [c source] and [c width]:

        [code
            [image ( source="images/juicy apple.png" width="400" ) ]
        code]

        As we can see:

        [list

            [el
                Attributes are enclosed in parentheses:
                [code()
                    ( ... )
                code]
            ]

            [el
                The syntax [c name = "value"] is used to assign a value to an attribute. For example:
                [code
                    width="400"
                code]
            ]

            [el
                Attribute assignments are separated by a space. No comma is needed:
                [code()
                    (a1="v1" a2="v2")
                            ^
                code]
            ]
        ]

        The list of available attributes for each node is documented in the [link url=[!get pml_website]/docs/reference_manual/index.html text = "PML Reference Manual"].
    ]

    [ch (id=HTML_attributes) [title HTML Attributes]

        [i HTML attributes] can optionally be specified for some nodes.

        This is used to explicitly set HTML attributes in the resulting HTML code. The most frequent use of HTML attributes is to explicitly set the [c style] for a specific element.

        An HTML attribute name starts with [c html_], followed by the real HTML attribute name. Thus, to specify a [c style] attribute in the resulting HTML code, you would write for example: [c html_style="color:red;"]. Any valid CSS can be assigned to a [c html_style] attribute.

        Suppose we want to write a paragraph in red letters, surrounded by a blue dashed border. We can do it like this:

        [list

            [el [header PML code:]
                [code
                    [p (html_style = "color:red; border:1px dashed blue")
                        It is important to note that ...
                    ]
                code]
            ]

            [el [header Result:]
                [p (html_style = "color:red; border:1px dashed blue")
                    It is important to note that ...
                ]
            ]

            [el [header Generated HTML code:]
                [code
                    <p style="color:red; border:1px dashed blue" class="pml-paragraph">It is important to note that ... </p>
                code]
            ]
        ]

        To see if HTML attributes are [i allowed] for a given node, please refer to the [link url=[!get pml_website]/docs/reference_manual/index.html text = "PML Reference Manual"].

        To see the [i list] of attributes supported for a given node, please refer to the official HTML specification.
    ]

    [ch [title Documentation]

        As said already, all nodes and their attributes are documented in the [link url=[!get pml_website]/docs/reference_manual/index.html text = "PML Reference Manual"].

        Another way to get information about nodes is to use the integrated help of the PML Converter. You can type the following command in a terminal to get an overview of how to use it:
        [input
            pmlc help
        input]

        For help on a specific node (such as [c image]), the [c tag_info] command can be used:
        [input
            pmlc tag_info -tag image
        input]
    ]
]
