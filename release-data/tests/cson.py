#! /usr/bin/python
#
# coding: utf8
#
# cson (schema-compessed json)
#
# author: Russell Leake, http://leakerlabs.com, gt3389b@gmail.com
# note: based on CSON-js by JongChan Choi, https://github.com/disjukr/CSON-js
# license: MIT https://github.com/gt3389b/python-cson/blob/master/LICENSE
# origin: https://github.com/gt3389b/python-cson/blob/master/cson.py
from __future__ import print_function
from __future__ import unicode_literals
import argparse, copy, json, sys
__all__ = ('loads', )

def isName(char):
    return not ((char == ',') or
                    (char == '=') or
                    (char == '"') or
                    (char == '\'') or
                    (char == '[') or
                    (char == '{') or
                    (char == ']') or
                    (char == '}') or
                    (char == ' ') or
                    (char == '#') or
                    (char == '\n') or
                    (char == ':'))

def isWS(char):
    return (char == ' ')

def isCRLF(char, nextChar):
    return (char == '\r') and (nextChar == '\n')

def isNameSeparator(char):
    return (char == ':') or (char == '=')

def isEndOfDQuote(prevChar, char):
    return (prevChar != '\\') and (char == '\"')

def isEndOfSQuote(prevChar, char):
    return (prevChar != '\\') and (char == '\'')

def isBeginOfBracket(char):
    return (char == '[') or (char == '{')

def isEndOfBracket(char):
    return (char == ']') or (char == '}')

def isBracket(char):
    return isBeginOfBracket(char) or isEndOfBracket(char)

def stringToLiteral(string):
    string = string.replace('\\', '\\\\')
    string = string.replace('\b', '\\b')
    string = string.replace('\f', '\\f')
    string = string.replace('\n', '\\n')
    string = string.replace('\r', '\\r')
    string = string.replace('\t', '\\t')
    string = string.replace('\"', '\\\"')
    return string

def isNumber(s):
    """ Checks to see if this is a JSON number """
    try:
        float(s)
        return True
    except ValueError:
        return False

def isBoolean(s):
    """ Checks to see if this is a JSON bool """
    if (s == 'true') or (s == 'false'):
        return True
    else:
        return False

def isRef(s):
    if len(s):
        if s[0] == '@':
            return True
    return False

def isNull(s):
    """ Checks to see if this is a JSON null object """
    if s == 'null':
        return True
    else:
        return False

def get_iterable(text):
    if type(text) == list:
        iterable = range(len(text))
    elif type(text) == dict:
        iterable = cson_data.keys()
    else:
        iterable = len(list(text))
    return iterable

def tokenize(text):
    tokens = []
    iterable = get_iterable(text)
    i = 0
    while i < iterable:
        currentChar = text[i]
        if i < iterable - 1:
            nextChar = text[i + 1]
        else:
            nextChar = None

        if isBracket(currentChar):
            tokens.append(currentChar)
            i += 1
        elif (currentChar == ',') or (currentChar == '\n'):
            i += 1
        elif (nextChar != None) and isCRLF(currentChar, nextChar):
            i += 1
        elif isNameSeparator(currentChar):
            tokens.append(':')
            i += 1
        # Address Quotes
        elif (currentChar == '\"') or (currentChar == '\''):
            buffer = ''
            isSQuote = currentChar == '\''
            escapeCount = 0
            i += 1
            currentChar = text[i]
            prevChar = text[i - 1]

            while (not (isEndOfSQuote(prevChar, currentChar) if isSQuote else isEndOfDQuote(prevChar, currentChar))) and (i < iterable):
                if isSQuote and (currentChar == '\"') and ((escapeCount % 2) == 0):
                    buffer += '\\'
                buffer += currentChar
                if currentChar == '\\':
                    escapeCount += 1
                i += 1
                if i < iterable:
                    currentChar = text[i]
                    if i < iterable - 1:
                        prevChar = text[i - 1]
            tokens.append('\"' + buffer + '\"')
            i += 1
        # Address Verbatim
        elif currentChar == '|':
            buffer = ''
            verbatimBuffer = []
            verbatimExit = False
            i += 1
            while i < iterable:
                currentChar = text[i]
                if i < iterable - 1:
                    nextChar = text[i + 1]
                if verbatimExit:
                    if currentChar == '|':
                        verbatimExit = False;
                        i += 1
                        continue
                    elif isCRLF(currentChar, nextChar):
                        i += 1
                        break
                    elif currentChar == '\n':
                        break
                    elif not isWS(currentChar):
                        i -= 1
                        break
                elif isCRLF(currentChar, nextChar):
                    i += 1
                    verbatimBuffer.append(stringToLiteral(buffer))
                    buffer = ''
                    verbatimExit = True
                elif currentChar == '\n':
                    verbatimBuffer.append(stringToLiteral(buffer))
                    buffer = ''
                    verbatimExit = True
                else:
                    buffer += currentChar
                i += 1
            if not verbatimExit:
                verbatimBuffer.append(stringToLiteral(buffer))
            buffer = ''
            tokens.append('\"' + '\\n'.join(verbatimBuffer) + '\"')
        # Address comments
        elif currentChar == '#':
            while i < iterable:
                currentChar = text[i];
                if i < iterable - 1:
                    nextChar = text[i + 1];
                if currentChar == '\n':
                    break
                elif isCRLF(currentChar, nextChar):
                    i += 1
                    break
                i += 1
        # Address extraneous WS
        elif isWS(currentChar):
            while isWS(currentChar) and (i < iterable):
                i += 1
                if i < iterable:
                    currentChar = text[i]
        else:
            if not isName(nextChar):
                tokens.append(currentChar)
                i += 1
                continue
            buffer = currentChar
            i += 1
            while i < iterable:
                currentChar = text[i]
                if i < iterable - 1:
                    nextChar = text[i + 1]
                i += 1
                buffer += currentChar
                if not isName(nextChar):
                    break
            tokens.append(''.join(buffer))
    return tokens

def toJSON(text, indent=0):
    """ Convert 'text' from cson to a json string """

    # first tokenize the string
    tokens = tokenize(text)

    indentLevel = 0
    if indent != '0':
        if isinstance(indent, int):
            indent = '    ' * indent

    def newline():
        global ident
        global identLevel
        result = '\n'
        if indent == '0':
            return result
        i = 0
        while i < indentLevel:
            result += indent
            i += 1
        return result

    if not isBeginOfBracket(tokens[0]):
        if len(tokens) > 1:
            if tokens[1] == ':':
                tokens.insert(0, '{')
                tokens.append('}')
            else:
                tokens.insert(0, '[')
                tokens.append(']')

    i = 0
    while i < len(tokens):
        token = tokens[i]

        prevToken = nextToken = None

        if i < len(tokens) - 1:
            nextToken = tokens[i + 1]

        if i > 0:
            prevToken = tokens[i - 1]

        if indent:
            if token == ':':
                tokens[i] += ' '
            if isBeginOfBracket(token[0]):
                indentLevel += 1
            if isEndOfBracket(token[0]):
                indentLevel -= 1

        # if a key_name needs to be quoted, then add quotes
        if isName(token[0]) and (nextToken == ':'):
            tokens[i] = '\"' + tokens[i] + '\"'
        # if a value_name needs to be quoted, then add quotes
        elif isName(token[0]) and (':' == (prevToken[0] if prevToken != None else None)):
            # make sure we don't quote native JSON values like numbers, bools, and nulls
            if isNumber(tokens[i]):
                pass
            elif isBoolean(tokens[i]):
                pass
            elif isNull(tokens[i]):
                pass
            elif isRef(tokens[i]):
                # Quote references and mark them with a special start sequence.  By treating them as a JSON string, it 
                # allows us to use the JSON library to directly convert into data structures.  Then we can easily walk the data structures
                # and reassign the values 
                tokens[i] = '\"@@' + tokens[i] + '\"'
            else:
                tokens[i] = '\"' + tokens[i] + '\"'

        if nextToken:
            if not (isNameSeparator(token[0]) or isNameSeparator(nextToken[0]) or isBeginOfBracket(token[0]) or isEndOfBracket(nextToken[0])):
                tokens[i] += ','
                if indent:
                    tokens[i] += newline()

        i += 1

    if indent:
        i = 0
        while i < len(tokens):
            token = tokens[i]
            if i > 0:
                prevToken = tokens[i - 1]
            else:
                prevToken = None

            if i < len(tokens) - 1:
                nextToken = tokens[i + 1]
            else:
                nextToken = None;

            if isBeginOfBracket(token[0]):
                indentLevel += 1
                if nextToken:
                    if not isEndOfBracket(nextToken[0]):
                        tokens[i] += newline()

            if isEndOfBracket(token[0]):
                indentLevel -= 1
                if prevToken:
                    if not isBeginOfBracket(prevToken[0]):
                        tokens[i] = newline() + token
            i += 1

    return ''.join(tokens)

def csons2json(csonString, indent=0):
    return toJSON(csonString, indent)

def getrefvalue(dataObj, ref):
    """ Derefernce a scope (e.g. .item.subitem) into a value """
    namespace = ref.split('.')[1:]
    keyRef = dataObj
    for name in namespace:
        keyRef = keyRef[name]
    return keyRef

def setrefvalue(dataObj, ref, value):
    """ Derefernce a scope (e.g. .item.subitem) into a value """
    namespace = ref.split('.')[1:]
    keyRef = dataObj
    for name in namespace[:-1]:
        keyRef = keyRef[name]

    try:
        keyRef[namespace[-1:][0]] = value
    except KeyError:
        raise Exception("Dead reference")

def findrefs(obj, refs, namespace):
    """ Find all of the @@@references in a dictionary hierarchy.
        Return them as a list """
    if isinstance(obj,dict):
        for k, v in obj.items():
            if type(v) == str:
                if v[:3] == "@@@": 
                    refs.append(namespace+'.'+k)
            if isinstance(v,dict):
                item = findrefs(v, refs, namespace+'.'+k)

def resolveRefs(dataObj, refs):
    """ Resolve the @@@reference list """
    while len(refs):
        found = None
        for i in refs:
            # Get reference
            dataRef = getrefvalue(dataObj, i)

            # Check if the reference points to a parent scope (b.c -> b)
            if type(dataRef) == str:
                if dataRef[:3] == "@@@":
                    if '.'+dataRef[3:] == i[:len(dataRef[3:])+1]:
                        raise Exception("Recursion detected")

            refVal = getrefvalue(dataObj, '.'+dataRef[3:])

            if "@@@" in json.dumps(refVal):
                continue

            found = i
            break

        if found:
            setrefvalue(dataObj, found, copy.deepcopy(refVal))
            refs.remove(found)
        else:
            # this means there was only references to references
            raise Exception("Recursion detected")

def _decode_list(data):
    """ Only used for Python2.X """
    rv = []
    for item in data:
        if isinstance(item, unicode):
            item = item.encode('utf-8')
        elif isinstance(item, list):
            item = _decode_list(item)
        elif isinstance(item, dict):
            item = _decode_dict(item)
        rv.append(item)
    return rv

def _decode_dict(data):
    """ Only used for Python2.X """
    rv = {}
    for key, value in data.iteritems():
        if isinstance(key, unicode):
            key = key.encode('utf-8')
        if isinstance(value, unicode):
            value = value.encode('utf-8')
        elif isinstance(value, list):
            value = _decode_list(value)
        elif isinstance(value, dict):
            value = _decode_dict(value)
        rv[key] = value
    return rv

def csons2py(csonString):
    # First convert the CSON -> JSON -> dataObj
    if sys.version_info[0] < 3:
        dataObj = json.loads(toJSON(csonString), object_hook=_decode_dict)
    else:
        dataObj = json.loads(toJSON(csonString))

    # Next, @references are converted to "@@@reference" strings.  Let's find all
    # references in the data and put them in a list
    refs = []
    findrefs(dataObj, refs, '')

    # Sort the references so that substitution is cascading
    refs = resolveRefs(dataObj, refs)

    return dataObj

def cson2py(filename):
    with open(filename, 'r') as infile:
        return csons2py(''.join(infile.readlines()))

def main():
    """
    Define and parse `optparse` options for command-line usage.
    """
    parser = argparse.ArgumentParser(description='A Python implementation of a CSON interpreter. https://pypi.python.org/pypi/python-cson')
    parser.add_argument("-f", "--file", dest="filename", required=True, help="hash table filename", metavar="OUTPUT_FILE")
    parser.add_argument("-v", "--verbose", action="store_true", dest="verbose", default=False, help="Print all warnings")
    parser.add_argument('input_file')

    args = parser.parse_args()

    data = load(args.input_file)
    if args.filename:
        with open(args.filename, 'w') as outfile:
            outfile.write(json.dumps(data))
    else:
        print(json_data)

loads = csons2py
load = cson2py

if __name__ == "__main__":
   main()

# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
