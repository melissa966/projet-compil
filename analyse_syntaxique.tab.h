
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     Program = 258,
     PDEC = 259,
     dp = 260,
     pvg = 261,
     ou = 262,
     adefine = 263,
     egale = 264,
     arobase = 265,
     IF = 266,
     ELSE = 267,
     ENDIF = 268,
     PINST = 269,
     Begin = 270,
     aff = 271,
     sup = 272,
     inf = 273,
     diff = 274,
     supegal = 275,
     infegal = 276,
     et = 277,
     FOR = 278,
     WHILE = 279,
     DO = 280,
     ENDFOR = 281,
     integer = 282,
     reel = 283,
     IDF = 284,
     Pint = 285,
     Pfloat = 286,
     pf = 287,
     po = 288,
     END = 289,
     fininst = 290,
     plus = 291,
     moins = 292,
     mult = 293,
     divv = 294,
     egaleEgale = 295
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 17 "analyse_syntaxique.y"

     int entier;
     float reeel;
     char* str;



/* Line 1676 of yacc.c  */
#line 100 "analyse_syntaxique.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


