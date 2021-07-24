Definitions.

ATOM       = [a-z]
TRUE_SIGN  = T\[
FALSE_SIGN = F\[
OPERATORS  = [&|!>]
WHITESPACE = [\s\t\n\r]

Rules.

{ATOM}        : {token, {atom, TokenLine, list_to_atom(TokenChars)}}.
{TRUE_SIGN}   : {token, {'T', TokenLine, 'T'}}.
{FALSE_SIGN}  : {token, {'F', TokenLine, 'F'}}.
{OPERATORS}   : {token, {op_to_atom(TokenChars), TokenLine, op_to_atom(TokenChars)}}.
\(            : {token, {'(',  TokenLine}}.
\)            : {token, {')',  TokenLine}}.
\]            : {token, {']',  TokenLine}}.
{WHITESPACE}+ : skip_token.

Erlang code.

op_to_atom([$&|_]) ->
    'conjunction';

op_to_atom([$||_]) ->
    'disjunction';

op_to_atom([$!|_]) ->
    'negation';

op_to_atom([$>|_]) ->
    'implication'.