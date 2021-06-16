"""Helper methods used in UltiSnips snippets."""

import string
import vim
import re


def is_visual_mode(snip):
    return snip.visual_mode == 'v'


def is_visual_line_mode(snip):
    return snip.visual_mode == 'V'


def delete_all_right(snip, relative_column=0):
    snip.buffer[snip.line] = snip.buffer[snip.line][:snip.cursor[1] + relative_column]
    snip.cursor.set(snip.line, -1)


def clear_line(snip, relative_line=0):
    snip.buffer[snip.line + relative_line] = ''
    snip.cursor.set(snip.line, -1)


def _parse_comments(s):
    """ Parses vim's comments option to extract comment format """
    i = iter(s.split(","))

    rv = []
    try:
        while True:
            # get the flags and text of a comment part
            flags, text = next(i).split(':', 1)

            if len(flags) == 0:
                rv.append(('OTHER', text, text, text, ""))
            # parse 3-part comment, but ignore those with O flag
            elif 's' in flags and 'O' not in flags:
                ctriple = ["TRIPLE"]
                indent = ""

                if flags[-1] in string.digits:
                    indent = " " * int(flags[-1])
                ctriple.append(text)

                flags, text = next(i).split(':', 1)
                assert flags[0] == 'm'
                ctriple.append(text)

                flags, text = next(i).split(':', 1)
                assert flags[0] == 'e'
                ctriple.append(text)
                ctriple.append(indent)

                rv.append(ctriple)
            elif 'b' in flags:
                if len(text) == 1:
                    rv.insert(0, ("SINGLE_CHAR", text, text, text, ""))
    except StopIteration:
        return rv


def get_comment_format():
    """ Returns a 4-element tuple (first_line, middle_lines, end_line, indent)
    representing the comment format for the current file.
    It first looks at the 'commentstring', if that ends with %s, it uses that.
    Otherwise it parses '&comments' and prefers single character comment
    markers if there are any.
    """
    commentstring = vim.eval("&commentstring")
    if commentstring.endswith("%s"):
        c = commentstring[:-2]
        return (c.rstrip(), c.rstrip(), c.rstrip(), "")
    comments = _parse_comments(vim.eval("&comments"))
    for c in comments:
        if c[0] == "SINGLE_CHAR":
            return c[1:]
    return comments[0][1:]


def is_simple_comment_format():
    return get_comment_format()[0] == get_comment_format()[2]
