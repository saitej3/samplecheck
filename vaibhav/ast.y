%{
/*this is yacc program */
#include<stdio.h>
#include<math.h>
struct ast_node
{
  char *root;
  struct ast_node * left;
  struct ast_node * right;
};

struct ast_node * mknode (char *r, struct ast_node * left, struct ast_node * right)
{
  struct ast_node * ast_node = (struct ast_node*)malloc (sizeof (struct ast_node));
  ast_node->root = r;
  ast_node->left = left;
  ast_node->right = right;
  return ast_node;
}

void Inorder(struct ast_node* Root)
{
    if(Root != NULL)
    {
        Inorder(Root->left);
        printf("%s",Root->root);
        Inorder(Root->right);
    }
}
%}
%token number

%%
        S:E { printf("The result is \n\n");
                Inorder($1);    }
         ;
        E : E '+' T      { $$ = mknode("+", $1, $3); }
         | T            { $$ = $1; }
         ;
        T : T '*' F      { $$ = mknode("*", $1, $3); }
         | F     { $$ = $1; }
         ;
        F : '(' E ')'    { $$ = $2; }
         | number          { char *s=(char*)malloc(10);
                             sprintf(s,"%d",$1);
                             $$ = mknode(s,NULL,NULL); }
         ;
%%
int main()
{
printf("enter an expression");
yyparse();
}
yyerror()
{
printf("error \n");
}

