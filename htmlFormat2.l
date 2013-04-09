	int indents = 0;
%s textbefore 
%s indento
%%
<textbefore>\<                      endline(); imprimirIndent(); imprimir(); indents++; BEGIN 0; 
<textbefore>\<\/                    endline(); indents--; imprimirIndent(); imprimir(); BEGIN 0; 
\<                                  imprimirIndent(); imprimir(); indents++;  
\>                                  imprimir(); endline(); imprimirIndent(); BEGIN 0;
\<\/                                indents--; imprimirIndent(); imprimir(); 
\n                                   
.                                   imprimir(); BEGIN textbefore; 
%%
    void endline(){
        printf("\n"); 
    }
    void imprimirIndent() {
        int i;
        for( i = 0; i<indents; i++){
            printf("\t");
        }
    }
 	void imprimir (){
        printf("%s",yytext);
    }
    
    int	main()
	{
		yylex();
	}
