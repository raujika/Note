/* Companion source code for "flex & bison", published by O'Reilly
 * Media, ISBN 978-0-596-15597-1
 * Copyright (c) 2009, Taughannock Networks. All rights reserved.
 * See the README file for license conditions and contact info.
 * $Header: /home/johnl/flnb/code/RCS/fb1-1.l,v 2.1 2009/11/08 02:53:18 johnl Exp $
 */

/* fb1-1 just like unix wc */
%{
char* subsl(const char* input, int offset);
char* subString (const char* input, int offset, int len, char* dest);
char* strndup (const char *s, size_t n);
char* subsl(const char* input, int offset);
char* substring(const char* str, size_t begin, size_t len);
void calc(int num,char mask[]);
void nmcalc(char str[],char b[]);
void decToBinStr8bit(int n,char str[]);
char text[36];
%}

%%
"b "[0-9]+"."[0-9]+"."[0-9]+"."[0-9]+ { nmcalc(subsl(yytext,2),text); printf("%s",text);strcpy(text,""); }
"n "[0-9]+ {calc(atoi(subsl(yytext,2)),text); printf("%s",text);strcpy(text,"");}
%%

char* subsl(const char* input, int offset){
    return substring(input, offset,strlen(input)-offset);
}

void calc(int num,char mask[]) {
    int i=0;
    while (i <= 32){
        if(i==8){
            //printf("\n%d\n",i);
            strcat(mask,".");
        }if(i==16){
            //printf("\n%d\n",i);
            strcat(mask,".");
        }if(i==24){
            //printf("\n%d\n",i);
            strcat(mask,".");
        }else{
            //printf("\n%d\n",i);
            if(num==0){
                strcat(mask,"0");
   // printf("\n%d\n",num);
            }if(num>0){
                strcat(mask,"1");
  //  printf("\n%d\n",num);
                num--;
            }
        }
        i++;
    }
    //printf("\n%d\n",strlen(mask));
}

char* subString (const char* input, int offset, int len, char* dest)
{
    /*  
    char dest[80];
    const char* source = "hello world";
    if (subString (source, 0, 5, dest)){
    printf ("%s\n", dest);
    }*/
    int input_len = strlen (input);
     
    if (offset + len > input_len) {
        return NULL;
    }
    strncpy (dest, input + offset, len);
    return dest;
}
 
char* substring(const char* str, size_t begin, size_t len) 
{ 
  if (str == 0 || strlen(str) == 0 || strlen(str) < begin || strlen(str) < (begin+len)) 
    return 0; 
 
  return strndup(str + begin, len); 
} 
 
char *strndup (const char *s, size_t n)
{
  char *result;
  size_t len = strlen (s);
 
  if (n < len)
    len = n;
 
  result = (char *) malloc (len + 1);
  if (!result)
    return 0;
 
  result[len] = '\0';
  return (char *) memcpy (result, s, len);
}

void nmcalc(char str[],char b[]) {
  char *delim = ".";
  char *pch;
  char a[8]={0};
  int num;
  int i =0;
   
  pch = strtok(str,delim);
  while (pch != NULL){
    i++;
    num=atoi(pch);
    decToBinStr8bit(num,a);
    strcat(b,a);
    if(i<4){
        strcat(b,".");
    }
    pch = strtok(NULL, delim);
  }     
}
  
void decToBinStr8bit(int n,char str[]){
    int c, k;
    strcpy(str,"");
    for (c = 7; c >= 0; c--) {
        k = n >> c;
          
            if (k & 1)
              strcat(str,"1");
        else
              strcat(str,"0");
    }
}

int yywrap()
{
	return 1;
}

int main()
{
  yylex();
  return 0;
}


