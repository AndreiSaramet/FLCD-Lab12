/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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
     ID = 258,
     CONST = 259,
     LET = 260,
     INTEGER = 261,
     CHARACTER = 262,
     STRING = 263,
     READ = 264,
     WRITE = 265,
     IF = 266,
     THEN = 267,
     ELSE = 268,
     AND = 269,
     OR = 270,
     NOT = 271,
     IS = 272,
     ISNOT = 273,
     BEGIN_T = 274,
     END = 275,
     FOR = 276,
     WHILE = 277,
     DO = 278,
     PE = 279,
     ME = 280,
     TE = 281,
     DE = 282,
     MDE = 283,
     PP = 284,
     MM = 285,
     LE = 286,
     GE = 287
   };
#endif
/* Tokens.  */
#define ID 258
#define CONST 259
#define LET 260
#define INTEGER 261
#define CHARACTER 262
#define STRING 263
#define READ 264
#define WRITE 265
#define IF 266
#define THEN 267
#define ELSE 268
#define AND 269
#define OR 270
#define NOT 271
#define IS 272
#define ISNOT 273
#define BEGIN_T 274
#define END 275
#define FOR 276
#define WHILE 277
#define DO 278
#define PE 279
#define ME 280
#define TE 281
#define DE 282
#define MDE 283
#define PP 284
#define MM 285
#define LE 286
#define GE 287




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

