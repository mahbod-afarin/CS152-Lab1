%{ 
   int currLine = 1, currPos = 1;
%}

DIGIT    [0-9]
   
%%

"-"            {printf("MINUS\n"); currPos += yyleng;}
"+"            {printf("PLUS\n"); currPos += yyleng;}
"*"            {printf("MULT\n"); currPos += yyleng;}
"/"            {printf("DIV\n"); currPos += yyleng;}
"="            {printf("EQUAL\n"); currPos += yyleng;}
"("            {printf("L_PAREN\n"); currPos += yyleng;}
")"            {printf("R_PAREN\n"); currPos += yyleng;}
"_"            {printf("UNDER_SCORE\n"); currPos += yyleng;}


{DIGIT}+       {printf("NUMBER %s\n", yytext); currPos += yyleng;}

[ \t]+         {/* ignore spaces */ currPos += yyleng;}

"\n"           {currLine++; currPos = 1;}

.              {printf("Error at line %d, column %d: unrecognized symbol \"%s\"\n", currLine, currPos, yytext); exit(0);}

%%

int main(int argc, char ** argv)                   
{
   yylex();
}