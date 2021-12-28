[ch (id=parameters) [title Parameters]

    If you have text or markup snippets appearing several times in a document, you can use a [i parameter] to avoid retyping or copy/pasting the same text again and again.

    A parameter is composed of an [i identifier] (unique name) and a [i value]. The syntax for assigning a value to a parameter is:

    [code
        [!set name = value]
    code]

    Note the mandatory [c !] before the node name [c set]. Node names starting with [c !] are nodes related to text processing.

    The value assigned to a parameter can be re-used in the document with the following syntax:

    [code
        [!get name]
    code]

    Here is an example of a URL that is re-used two times.

    [list

        [el [header PML code:]
            [code
                [!set docs_root_URL = http://www.example.com/project/docs/public]

                For an overview please read the article [link url=[!get docs_root_URL]/concepts.html text="Basic Concepts"].

                For detailed information please refer to the [link url=[!get docs_root_URL]/user_manual.html text="User Manual"].
            code]
        ]

        [el [header Result:]
            [!set docs_root_URL = http://www.example.com/project/docs/public]

            For an overview please read the article [link url=[!get docs_root_URL]/concepts.html text="Basic Concepts"].

            For detailed information please refer to the [link url=[!get docs_root_URL]/user_manual.html text="User Manual"].
        ]
    ]

    You can define any number of parameters, anywhere in the document. Parameters are often defined at the beginning of the document, just after the [c doc] node. After declaring a parameter, its value can be re-used any number of times in the document.

    After assigning a value to a parameter, its value cannot be changed later in the document. Parameters are like [i constants] in programming languages.

    The syntax rules for assigning values to parameters are the same as those for attributes (lenient parsing, whitespace, and character escapes).

    A parameter identifier must start with a letter or an underscore, and can be followed by any number of letters, digits, underscores, hyphens, and dots. Note for programmers: The regex of an identifier is: [c \[a-zA-Z_\]\[a-zA-Z0-9_\\.-\]*]. Identifiers are case-sensitive. The following identifiers are all different: [c name], [c Name], and [c NAME].

    You can assign several parameters in a single [c set] node. For example:
    [code
        [!set
            color = "deep blue"
            default_width = 300
        ]
    code]

    Besides assigning simple [i text] snippets to parameters, you can also assign [i markup] snippets to re-reuse. Imagine, for example, that a company logo needs to be inserted several times in the document. Suppose that the markup code to be inserted is:
    [code
        [image source=images/company_logo.png width=200 height=200 border=yes]
    code]
    Re-inserting this code several times would be cumbersome. Worse, it would be hard to maintain. For example, if the logo's dimensions are changed later, the change must be done everywhere the node is used.
    These inconveniences can easily be eliminated by using a parameter. Here is the code to define the code once and re-use it two times:
    [code
        [!set company_logo = "[image source=images/company_logo.png width=200 height=200 border=yes]"]
        ...
        [!get company_logo]
        ...
        [!get company_logo]
    code]
[- test
        [!set company_logo = "[image source=images/company_logo.png width=200 height=200 border=yes]"]
        ...
        [!get company_logo]
        ...
        [!get company_logo]
-]
    If the dimensions are changed later, you just need to make the change at one place.

    Parameters can use other parameters that have already been defined in the document. For example, you might want to define a common root directory once, and re-use it in the definition of subsequent parameters:
    [code
        [!set root_directory = /foo/bar/]
        [!set images_directory = "[!get root_directory]images"]
        [!set examples_directory = "[!get root_directory]examples"]

        [p Images: [!get images_directory]]
        [p Examples: [!get examples_directory]]
    code]
    This is rendered as:
    [!set root_directory = /foo/bar/]
    [!set images_directory = "[!get root_directory]images"]
    [!set examples_directory = "[!get root_directory]examples"]

    [p Images: [!get images_directory]]
    [p Examples: [!get examples_directory]]
]
