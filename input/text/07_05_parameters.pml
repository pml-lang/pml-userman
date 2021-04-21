[ch title=Parameters

    If you have text snippets that appear several times in your document, you can use a [i parameter], to avoid retyping or copy/pasting the same text again and again.

    A parameter is composed of an [i identifier] (unique name) and a [i value]. The syntax for assigning a value to a parameter is:

    [code
        [const name = value]
    code]

    A parameter identifier must start with a letter and can be followed by any number of letters, digits, and underscores. Note for programmers: The regex of an identifier is: [c \[a-zA-Z\]\[a-zA-Z0-9_\]*]. Identifiers are case-sensitive. The following identifiers are all different: [c name], [c Name], and [c NAME].

    The value assigned to a parameter can be re-used in the document by simply specifying the parameter's identifier between [c <<] and [c >>], like this:

    [code
        <<name>>
    code]

    You can define any number of parameters, anywhere in the document. Usually parameters are defined at the beginning of the document, just after the [c document] node. After declaring a parameter, its value can be re-used any number of times in the document.

    Here is an example of a URL that is re-used two times.

    [list

        [el title = PML code:
            [code
                [const docs_root_URL = http://www.example.com/project/docs/public]

                For an overview please read the article [link url=<<docs_root_URL>>/concepts.html text=Basic Concepts].

                For detailed information please refer to the [link url=<<docs_root_URL>>/user_manual.html text=User Manual].
            code]
        ]

        [el title = Result:
            [const docs_root_URL = http://www.example.com/project/docs/public]

            For an overview please read the article [link url=<<docs_root_URL>>/concepts.html text=Basic Concepts].

            For detailed information please refer to the [link url=<<docs_root_URL>>/user_manual.html text=User Manual].
        ]
    ]
]
