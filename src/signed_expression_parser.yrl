Nonterminals signed elems neg.
Terminals 'T' 'F' '(' ')' ']' conjunction disjunction implication negation atom.
Rootsymbol signed.  

Left 100 implication.
Left 200 disjunction.
Left 300 conjunction.
Unary 400 negation.

%<expr> :== <term> {<or> <term>}
%<term> :== <factor> {<and> <factor>}
%<factor> :== <not> <factor> | "(" <expr> ")" | <const>
%<const> :== "true" | "false"

signed -> 'T' elems ']' : {true, '$2'}.
signed -> 'F' elems ']' : {false, '$2'}.


elems -> neg : '$1'.
elems -> elems conjunction elems : {extract_token('$2'), '$1' , '$3'}.
elems -> elems disjunction elems : {extract_token('$2'), '$1' , '$3'}.
elems -> elems implication elems : {extract_token('$2'), '$1' , '$3'}.
elems -> '(' elems ')' : '$2'.
elems -> atom : extract_token('$1').    

neg -> negation elems : {extract_token('$1'), '$2'}.   

%elems -> elem          : '$1'.
%elems -> '(' elems ')' : '$2'.
%elems -> negation elems : {extract_token('$1'), '$2'}.
%elems -> elem conjunction elems : {extract_token('$2'), '$1' , '$3'}.
%elems -> elem disjunction elems : {extract_token('$2'), '$1' , '$3'}.
%elems -> elem implication elems : {extract_token('$2'), '$1' , '$3'}.



%elem -> atom : extract_token('$1').

Erlang code.

extract_token({_Token, _Line, Value}) -> Value.