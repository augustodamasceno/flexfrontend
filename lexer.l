%{
// Reconhecedor de uma linguagem simplificada
#include <iostream>
#include "tokens.h"
using std::cout;
%}

%option noyywrap
delim	[ \t\n]
brancos {delim}+
letra	[A-Za-z]
digito	[0-9]
id	    ({letra}|_)(({letra}|{digito}|_)*) 
num	    {digito}+(\.{digito}+)?(E[+-]?{digito}+)?
string   \"([^"\\]|\\.|\\\\)*\"

%%
{brancos}	; // nenhuma ação e nenhum retorno
if		    return Tag::IF; 
then		return Tag::THEN; 
else		return Tag::ELSE; 
while		return Tag::WHILE; 
{id}		return Tag::ID;  
{num}	    return Tag::NUM; 
{string}    return Tag::STRING;
"||"        return Tag::OR; 
"&&"        return Tag::AND; 
"<"         return Tag::LT; 
"<="        return Tag::LTE; 
"=="        return Tag::EQ; 
"!="        return Tag::NE; 
">"         return Tag::GT;
">="        return Tag::GTE;
main        return Tag::MAIN;
int         return Tag::INTEGER;
float       return Tag::FLOATING;
bool        return Tag::BOOLEAN;
.           cout << YYText() << " é um token inválido!\n"; 
%%

// nenhuma função auxiliar é necessária
