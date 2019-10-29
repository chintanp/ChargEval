#!/usr/bin/env python3
# -*- coding: utf-8 -*-\
import sys,os

pardir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
print(pardir)
sys.path.append(pardir)

from sphinx_materialdesign_theme  import __version__

source_suffix = '.rst'
master_doc = 'index'

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = ['sphinx.ext.autodoc',
    'sphinx.ext.intersphinx',
    'sphinx.ext.mathjax',
    'sphinx.ext.viewcode', 
    'sphinx.ext.autosectionlabel'
    ]

autosectionlabel_prefix_document = True
mathjax_path="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"

# mathjax_config = {
#     'extensions': ['tex2jax.js'],
#     'jax': ['input/TeX', 'output/SVG'],
# }

version = __version__
release = __version__


project = 'EVI-DSS'
copyright = '2019, Chintan Pathak, Don MacKenzie'
author = 'Chintan Pathak, Don MacKenzie'

language = 'en'

templates_path = ['_templates']
html_sidebars = {
   '**': ['globaltoc.html']
}
html_favicon = '_static/favicon.ico'
html_logo = '_static/logo2.png'

html_theme = 'sphinx_materialdesign_theme'
html_theme_path = ['../']

html_theme_options = {
    # Specify a list of menu in Header.
    # Tuples forms:
    #  ('Name', 'external url or path of pages in the document', boolean, 'icon name')
    #
    # Third argument:
    # True indicates an external link.
    # False indicates path of pages in the document.
    #
    # Fourth argument:
    # Specify the icon name.
    # For details see link.
    # https://material.io/icons/
    'header_links' : [
       ('Home', 'index', False, 'home'),
       ("GitHub", " https://github.com/chintanp/evi-dss", True, 'link')
    ],

    # Customize css colors.
    # For details see link.
    # https://getmdl.io/customize/index.html
    #
    # Values: amber, blue, brown, cyan deep_orange, deep_purple, green, grey, indigo, light_blue,
    #         light_green, lime, orange, pink, purple, red, teal, yellow(Default: indigo)
    'primary_color': 'indigo',
    # Values: Same as primary_color. (Default: pink)
    'accent_color': 'pink',

    # Customize layout.
    # For details see link.
    # https://getmdl.io/components/index.html#layout-section
    'fixed_drawer': True,
    'fixed_header': True,
    'header_waterfall': True,
    'header_scroll': False,

    # Render title in header.
    # Values: True, False (Default: False)
    'show_header_title': False,
    # Render title in drawer.
    # Values: True, False (Default: True)
    'show_drawer_title': True,
    # Render footer.
    # Values: True, False (Default: True)
    'show_footer': True
}

html_show_sourcelink = True

rst_prolog= u"""
    .. |project| replace:: Sphinx Material Design Theme
"""
numfig = True

# -- Options for HTMLHelp output ------------------------------------------

# Output file base name for HTML help builder.
htmlhelp_basename = 'WSDOT-EVSEdoc'


# -- Options for LaTeX output ---------------------------------------------

latex_elements = {
    # The paper size ('letterpaper' or 'a4paper').
    #
    # 'papersize': 'letterpaper',

    # The font size ('10pt', '11pt' or '12pt').
    #
    # 'pointsize': '10pt',

    # Additional stuff for the LaTeX preamble.
    #
    # 'preamble': '',

    # Latex figure (float) alignment
    #
    # 'figure_align': 'htbp',
}

# Grouping the document tree into LaTeX files. List of tuples
# (source start file, target name, title,
#  author, documentclass [howto, manual, or own class]).
latex_documents = [
    (master_doc, 'EVI-DSS.tex', 'EVI-DSS Documentation',
     'Chintan Pathak, Don MacKenzie', 'manual'),
]


# -- Options for manual page output ---------------------------------------

# One entry per manual page. List of tuples
# (source start file, name, description, authors, manual section).
man_pages = [
    (master_doc, 'evi-dss', 'EVI-DSS Documentation',
     [author], 1)
]


# -- Options for Texinfo output -------------------------------------------

# Grouping the document tree into Texinfo files. List of tuples
# (source start file, target name, title, author,
#  dir menu entry, description, category)
texinfo_documents = [
    (master_doc, 'EVI-DSS', 'EVI-DSS Documentation',
     author, 'EVI-DSS', 'Decision Suspport System for EV Infrastructure Development.',
     'Miscellaneous'),
]