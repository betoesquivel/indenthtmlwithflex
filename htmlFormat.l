    int i, indents = 0, listas=0;
    char list = 0;

%s indento
%s textBef

%%
<INITIAL>\n     for(i=0; i<indents+listas; i++) printf("\t");
\n              BEGIN textBef;
<textBef>\<     {
                    BEGIN 0;
                    printf("\n");
                    for(i=0; i<indents+listas; i++) 
                        printf("\t");
                    indents++; printf("<");
                }
\<              indents++; printf("<"); BEGIN 0;
\<!             printf("<!"); BEGIN 0;
\<meta          printf("<meta"); BEGIN 0;
\>              {
                    BEGIN indento;
                    printf(">\n");
                    for(i=0; i<indents+listas; i++)
                        printf("\t");
                }
\<li          if(!list)listas++; list = 1;printf("<li");
\<\/li\>        listas--; printf("</li>");
\<\/            {
                    BEGIN 0;
                    --indents;
                    printf("\n");
                    for(i=0; i<indents+listas; i++) printf("\t");   
                    printf("</");
                }
\<strong\>|\<EM\>|\<\/strong\>|\<\/EM\>             printf("%s",yytext);
.               BEGIN textBef; printf("%s",yytext);
%%

    main()
        {
            yylex();
        }
