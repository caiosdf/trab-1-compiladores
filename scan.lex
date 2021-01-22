D	[0-9]
L	[A-Za-z_$]
WS	[ \t\n]
INT	{D}+
FLOAT	{INT}("."{INT})?([Ee]("+"|"-")?{INT})?
FOR    ("f"|"F")("o"|"O")("r"|"R")
IF    ("i"|"I")("f"|"F")
COMENTARIO_UMA_LINHA  (\/\/(.*))
COMENTARIO_VARIAS_LINHAS    "/*"(((\*+[^/*])|([^*]))*\**)"*/"  
STRING_ASPAS_SIMPLES   (\'.*\')
STRING_ASPAS_DUPLAS   (\".*\")
ID	{L}({L}|{D})*

%%
    
{WS}    { /* ignora espaço */ }   
{FOR}    { return _FOR; } 
{IF}    { return _IF; }
{INT}    { return _INT; }
{FLOAT}    {return _FLOAT; }     
{COMENTARIO_UMA_LINHA}    { return _COMENTARIO; }
{COMENTARIO_VARIAS_LINHAS}    { return _COMENTARIO; }
{STRING_ASPAS_SIMPLES}  { return _STRING; }
{STRING_ASPAS_DUPLAS}  { return _STRING; }
{ID}	{ return _ID; }
">="	{ return _MAIG; }
"<="    { return _MEIG; }
"=="    { return _IG; }
"!="    { return _DIF; }
.   { return *yytext; }
%%

