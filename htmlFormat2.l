	int indents = 0;
%x indento

%%
\n		{
			printf("\n");
			int i;
			for( i = 0; i<indents; i++){
				printf("\t");
			}
		}
<indento>\n	{
			BEGIN 0;
		}
\<		{
			printf("\n");
			int i;
			for( i = 0; i<indents; i++){
				printf("\t");
			}
			printf("<");
			++indents;
		}	
\<\/		{
			//tengo que indentar la linea con intents-1.
			--indents;	
			printf("\n");
			int i;
			for( i = 0; i<indents; i++){
				printf("\t");
			}
			printf("</");
		}	
\>		{
			printf(">");
			printf("\n");
			int i;
			for( i = 0; i<indents; i++){
				printf("\t");
			}
			BEGIN indento;
		}
.		{
			printf("%s", yytext);
			BEGIN 0;
		}
%%
 	public void imprimir (
	main()
	{
		yylex();
	}
