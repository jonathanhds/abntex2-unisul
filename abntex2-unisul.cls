%%
%% Customizações do abnTeX2 (http://abnTeX2.googlecode.com) para a Universidade do Sul de Santa Catarina
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status 'maintained'.
%%
%% The Current Maintainer of this work is Jonathan Henrique de Souza, jonathan.souza@unisul.br
%%
%% Further information about abnTeX2 are available on http://abntex2.googlecode.com/
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{abntex2-unisul}[2014/05/04 v1.0 Modelo da Universidade do Sul de Santa Catarina baseado em abntex2]

% Repassa os parâmetros ao abntex2
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{abntex2}
}

\PassOptionsToClass{
    chapter=TITLE,
    section=TITLE,
    sumario=tradicional,
    12pt, % Tamanho da fonte
    openright, % Capítulos começam em pág. ímpar (insere página vazia caso preciso)
    oneside, % Para impressão somente verso. Oposto a impressão em verso e anverso
    a4paper, % Tamanho do papel
    english, % Idioma adicional para hifenização
    french, % Idioma adicional para hifenização
    spanish, % Idioma adicional para hifenização
    brazil % o último idioma é o principal do documento
}{abntex2}

\ProcessOptions\relax
\LoadClass{abntex2}

% Pacotes
%% Sumário
\RequirePackage{tocloft}

%% Codificação
\RequirePackage[utf8]{inputenc} % Codificação de entrada
\RequirePackage[T1]{fontenc} % Codificação de saída

%% Fonte
\RequirePackage{times} % Times New Roman
\renewcommand{\familydefault}{\sfdefault} % Seta fonte default

\RequirePackage{lastpage} % Usado pela Ficha catalográfica
\RequirePackage{indentfirst} % Indenta o primeiro parágrafo de cada seção.
\RequirePackage{color} % Controle das cores
\RequirePackage{microtype} % Para melhorias de justificação
\RequirePackage{lscape} % Permite a criação de conteúdo em modo paisagem
\RequirePackage{hyperref} % Criação de links
\RequirePackage{etoolbox}

%% Cabeçalho padrao
\makepagestyle{abntheadings}
\makeevenhead{abntheadings}{\ABNTEXfontereduzida\thepage}{}{\ABNTEXfontereduzida\textit\leftmark}
\makeoddhead{abntheadings}{}{}{\ABNTEXfontereduzida\thepage}
\makeheadrule{abntheadings}{0pt}{\normalrulethickness}

%% Cabeçalho do inicio do capitulo
\makepagestyle{abntchapfirst}
\makeoddhead{abntchapfirst}{}{}{\ABNTEXfontereduzida\thepage}

%% Tabelas
\RequirePackage{multirow}

%% Sumário
\RequirePackage{textcase}

%% Imagens
\RequirePackage{graphicx} % Inclusão de gráficos
\graphicspath{{./img//}} % Diretório das imagens

%% Tamanho e alinhamento das legendas
\RequirePackage[singlelinecheck=false,justification=justified,font=footnotesize]{caption}

%% Citações
\RequirePackage[hyphenbreaks]{breakurl}
\RequirePackage[alf,abnt-emphasize=bf]{abntex2cite}

% Estilos
%% Membros da banca
\newcommand{\membrobancaA}{}
\newcommand{\membrobancaB}{}
\newcommand{\membrobancaC}{}

\providecommand{\imprimirmembrobancaA}{}
\providecommand{\imprimirmembrobancaAinst}{}
\renewcommand{\membrobancaA}[2][\imprimirinstituicao]{\renewcommand{\imprimirmembrobancaA}{#2}\renewcommand{\imprimirmembrobancaAinst}{#1}}

\providecommand{\imprimirmembrobancaB}{}
\providecommand{\imprimirmembrobancaBinst}{}
\renewcommand{\membrobancaB}[2][\imprimirinstituicao]{\renewcommand{\imprimirmembrobancaB}{#2}\renewcommand{\imprimirmembrobancaBinst}{#1}}

\providecommand{\imprimirmembrobancaC}{}
\providecommand{\imprimirmembrobancaCinst}{}
\renewcommand{\membrobancaC}[2][\imprimirinstituicao]{\renewcommand{\imprimirmembrobancaC}{#2}\renewcommand{\imprimirmembrobancaCinst}{#1}}

\newcommand{\imprimirmeOrientadorinst}{\imprimirinstituicao}
\newcommand{\imprimirmeCoorientadorinst}{\imprimirinstituicao}

%% Natureza do trabalho
\providecommand{\imprimirnaturezatrabalho}{}
\newcommand{\naturezatrabalho}[1]{
    \renewcommand{\imprimirnaturezatrabalho}{#1}
}

%% Redefinir capa
\renewcommand{\imprimircapa}{
    \begin{capa}
        \begin{center}
            \includegraphics[height=2.5cm, width=3.5cm]{logo_unisul}\par
            \bfseries

            \MakeUppercase\imprimirinstituicao\\
            \MakeUppercase\imprimirautor

            \vfill
            \MakeUppercase\imprimirtitulo
            \vfill

            \imprimirlocal\\
            \imprimirdata
        \end{center}
    \end{capa}
}

%% Redefinir folha de rosto
\renewcommand{\folhaderostocontent}{
    \begin{center}
        \textbf{\MakeUppercase\imprimirautor}

        \vspace*{\fill}

        \textbf{\MakeUppercase\imprimirtitulo}

        \vspace*{\fill}

        \abntex@ifnotempty{\imprimirpreambulo}{
            \hspace{.45\textwidth}
            \begin{minipage}{.5\textwidth}
                \begin{scriptsize}
					\imprimirpreambulo
				\end{scriptsize}
            \end{minipage}
        }

        \vspace*{\fill}

        \abntex@ifnotempty{\imprimirorientador}{
            \begin{center}
                \imprimirorientadorRotulo~\imprimirorientador\par
                \abntex@ifnotempty{\imprimircoorientador}{
                    {\imprimircoorientadorRotulo~\imprimircoorientador}
                }
            \end{center}
        }

        \vspace*{\fill}

        \imprimirlocal\\
        \imprimirdata
    \end{center}
}

%% Definir folha de aprovação
\newcommand{\imprimirfolhadeaprovacao}{
    \begin{folhadeaprovacao}
        \begin{center}
            \textbf{\MakeUppercase\imprimirautor}

            \vspace*{\fill}

            \textbf{\MakeUppercase\imprimirtitulo}

            \vspace*{\fill}

            \hspace{.45\textwidth}
            \begin{minipage}{.5\textwidth}
            	\begin{scriptsize}
					\imprimirnaturezatrabalho
				\end{scriptsize}
            \end{minipage}

            \vspace*{\fill}

            \imprimirlocal, \today

            \vspace*{\fill}

            \abntex@ifnotempty{\imprimirmembrobancaA}{
                \assinatura{\imprimirmembrobancaA \par \imprimirmembrobancaAinst}
            }
            \abntex@ifnotempty{\imprimirmembrobancaB}{
                \assinatura{\imprimirmembrobancaB \par \imprimirmembrobancaBinst}
            }
            \abntex@ifnotempty{\imprimirmembrobancaC}{
                \assinatura{\imprimirmembrobancaC \par \imprimirmembrobancaCinst}
            }
        \end{center}
    \end{folhadeaprovacao}
}

%% Redefinir dedicatória
\renewenvironment{dedicatoria}[1][]
{
        \ifthenelse{\equal{#1}{}}{
                \PRIVATEbookmarkthis{\dedicatorianame}
        }{\preamblealchapter{#1}}

        \vspace*{\fill}

    \begin{flushright}
        \hbox{}\vfill
        \begin{minipage}{.5\textwidth}
                                \setlength\parindent{0pt}
                                \setlength\parskip{12pt}
}
{
                \end{minipage}
        \end{flushright}
}

\renewenvironment{epigrafe}[1][]
{
        \ifthenelse{\equal{#1}{}}{
                \PRIVATEbookmarkthis{\epigraphname}
        }{\pretextualchapter{#1}}

        \vspace*{\fill}
}
{

}

%% Comando para inserir sigla
\newcommand{\sigla}[2][]{
    \item[#1] \textit{#2}
}

%% Redefinição da formatação do \chapter
\renewcommand{\ABNTEXchapterfont}{\normalfont\fontseries{b}\selectfont}
\renewcommand{\ABNTEXchapterfontsize}{\normalsize}
\renewcommand{\ABNTEXpartfont}{\fontseries{b}\selectfont\selectfont}
\renewcommand{\ABNTEXpartfontsize}{\normalsize}
\renewcommand{\ABNTEXsectionfont}{\normalfont\selectfont}
\renewcommand{\ABNTEXsectionfontsize}{\normalsize}
\renewcommand{\ABNTEXsubsectionfont}{\normalfont\fontseries{b}\selectfont}
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize}
\renewcommand{\ABNTEXsubsubsectionfont}{\normalfont\selectfont}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}
\renewcommand{\ABNTEXsubsubsubsectionfont}{\normalfont\itshape\selectfont}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}

%% Redefinição da formatação de Parágrafos
\setlength{\parindent}{2cm}
\setlength{\parskip}{0cm}

%% Sumário
\renewcommand*{\cftsectionfont}{\normalfont}
\renewcommand*{\cftsubsubsectionfont}{\normalfont}
\renewcommand*{\cftparagraphfont}{\normalfont\itshape}


%% Tornar as seções secundários com fonte em maiúscula
\makeatletter
\let\oldcontentsline\contentsline
\def\contentsline#1#2{%
  \expandafter\ifx\csname l@#1\endcsname\l@section
    \expandafter\@firstoftwo
  \else
    \expandafter\@secondoftwo
  \fi
  {%
    \oldcontentsline{#1}{\MakeTextUppercase{#2}}%
  }{%
    \oldcontentsline{#1}{#2}%
  }%
}
\makeatother

%% Tornar a entrada "Referências" com fonte em maiúscula
\addto\captionsbrazil{
    \renewcommand{\bibname}{REFER\^ENCIAS}
}

% Legendas
\makeatletter
\patchcmd{\caption@@@make}
  {\ifcaption@star}
    {\ifcaption@star\small}
    {}{}
\makeatother

%% Referencias
\RequirePackage[noabbrev,brazilian]{cleveref}

% posicionar imagens
\RequirePackage{float}

% para mostrar códigos fontes formatados
\RequirePackage{listingsutf8}
\RequirePackage{xcolor}

% formulas matematicas
\RequirePackage{mathtools}

% para comandos duplicados
\RequirePackage{savesym}

% declarar comandos
\RequirePackage{xparse}

%  duplicado
\savesymbol{su@ExpandTwoArgs}
\savesymbol{IfSubStringInString}
\savesymbol{su@IfSubStringInString}

 % siglas, abreviaturas, simbolos,glossario toc
\RequirePackage[acronym,symbols]{glossaries}

%-----------------------------------------------------------------------------
% CONFIGURACAO DO SUMARIO

% Modifica o espaçamento no sumário
% Nao ha espacos, exceto para as entradas de capitulos
\setlength{\cftbeforeparagraphskip}{0pt}
\setlength{\cftbeforesubsectionskip}{0pt}
\setlength{\cftbeforesectionskip}{0pt}
\setlength{\cftbeforesubsubsectionskip}{0pt}
\setlength{\cftbeforesubsubsubsectionskip}{0pt}
\setlength{\cftbeforechapterskip}{\onelineskip}

% Alteração da indentação dos itens do sumário
\cftsetindents{section}{0pt}{26pt}
\cftsetindents{subsection}{0pt}{36pt}
\cftsetindents{subsubsection}{0pt}{46pt}
%\cftsetindents{subsubsubsection}{0pt}{56pt} % TODO achar solucao

% Modifica a formatacao dos textos

% Secao Primaria (Chapter): Caixa alta, Negrito, tamanho 12
\makeatletter
\settocpreprocessor{chapter}{%
  \let\tempf@rtoc\f@rtoc%
  \def\f@rtoc{%
  \texorpdfstring{\bfseries\MakeTextUppercase{\tempf@rtoc}}{\tempf@rtoc}}%
}
\makeatother
%-----------------------------------------------------------------------------

% comando para juntar acronimo e glossario
% \newdualentry[glossary options][acronym options]{label}{abbrv}{long}{description}

\DeclareDocumentCommand{\newdualentry}{ O{} O{} m m m m } {

 \newglossaryentry{gls-#3}{name={#5},text={#5\glsadd{#3}},
   description={#6},#1
 }
 % \newacronym[see={[Glossário:]{gls-#3}},#2]{#3}{#4}{#5\glsadd{gls-#3}}
 \newacronym[#2]{#3}{#4}{\texttt{}\gls{gls-#3}}
}

\newglossarystyle{symbol}{%
  \setglossarystyle{list} % base this style on the list style
  \renewcommand*{\glossentry}[2]{%
    \item
      {\large\glossentrysymbol{##1}}
      \space \textbf{\glstarget{##1}{\glossentryname{##1}}}
      \glossentrydesc{##1}.
      \space ##2
   }
}


% equações
\everymath{\displaystyle}


% definicao de coloracao para linguagem JSON
\colorlet{punct}{red!60!black}
\definecolor{background}{HTML}{EEEEEE}
\definecolor{delim}{RGB}{20,105,176}
\colorlet{numb}{magenta!60!black}
\lstdefinelanguage{json}{
    basicstyle=\normalfont\ttfamily,
    numbers=left,
    numberstyle=\scriptsize,
    stepnumber=1,
    numbersep=8pt,
    showstringspaces=false,
    breaklines=true,
    frame=lines,
    backgroundcolor=\color{background},
    literate=
     *{0}{{{\color{numb}0}}}{1}
      {1}{{{\color{numb}1}}}{1}
      {2}{{{\color{numb}2}}}{1}
      {3}{{{\color{numb}3}}}{1}
      {4}{{{\color{numb}4}}}{1}
      {5}{{{\color{numb}5}}}{1}
      {6}{{{\color{numb}6}}}{1}
      {7}{{{\color{numb}7}}}{1}
      {8}{{{\color{numb}8}}}{1}
      {9}{{{\color{numb}9}}}{1}
      {:}{{{\color{punct}{:}}}}{1}
      {,}{{{\color{punct}{,}}}}{1}
      {\{}{{{\color{delim}{\{}}}}{1}
      {\}}{{{\color{delim}{\}}}}}{1}
      {[}{{{\color{delim}{[}}}}{1}
      {]}{{{\color{delim}{]}}}}{1}
      {é}{{\'e}}1
      {à}{{\`a}}1
      {á}{{\'a}}1,
}


% corrigir autoref, hyperref
\makeatletter
\def\HyLang@DeclareLang#1#2#3{%
  \@ifpackagewith{babel}{#1}{%
    \expandafter\HyLang@addto
        \csname extras#1\expandafter\endcsname
        \csname HyLang@#2\endcsname
    \begingroup
      \edef\x{\endgroup
        #3%
      }%
    \x
    \@namedef{HyLang@#1@done}{}%
  }{% added check for "main=#1" (presumably Heiko can do better)
    \@ifpackagewith{babel}{main=#1}{%
      \expandafter\HyLang@addto
        \csname extras#1\expandafter\endcsname
        \csname HyLang@#2\endcsname
      \begingroup
        \edef\x{\endgroup
          #3%
        }%
      \x
      \@namedef{HyLang@#1@done}{}%
     }{}%
  }%
  \begingroup
    \edef\x##1##2{%
      \noexpand\ifx##2\relax
        \errmessage{No definitions for language #2' found!}%
      \noexpand\fi
      \endgroup
      \noexpand\define@key{Hyp}{#1}[]{%
        \noexpand\@ifundefined{HyLang@#1@done}{%
          \noexpand\HyLang@addto{\noexpand##1}{\noexpand##2}%
          #3%
          \noexpand\@namedef{HyLang@#1@done}{}%
        }{}%
      }%
    }%
  \expandafter\x\csname extras#1\expandafter\endcsname
                \csname HyLang@#2\endcsname
}
% repeat the known language declarations
\HyLang@DeclareLang{english}{english}{}
\HyLang@DeclareLang{UKenglish}{english}{}
\HyLang@DeclareLang{british}{english}{}
\HyLang@DeclareLang{USenglish}{english}{}
\HyLang@DeclareLang{american}{english}{}
\HyLang@DeclareLang{german}{german}{}
\HyLang@DeclareLang{austrian}{german}{}
\HyLang@DeclareLang{ngerman}{german}{}
\HyLang@DeclareLang{naustrian}{german}{}
\HyLang@DeclareLang{russian}{russian}{\noexpand\hypersetup{unicode}}
\HyLang@DeclareLang{brazil}{portuges}{}
\HyLang@DeclareLang{brazilian}{portuges}{}
\HyLang@DeclareLang{portuguese}{portuges}{}
\HyLang@DeclareLang{spanish}{spanish}{}
\HyLang@DeclareLang{afrikaans}{afrikaans}{}
\HyLang@DeclareLang{french}{french}{}
\HyLang@DeclareLang{frenchb}{french}{}
\HyLang@DeclareLang{francais}{french}{}
\HyLang@DeclareLang{acadian}{french}{}
\HyLang@DeclareLang{canadien}{french}{}
\HyLang@DeclareLang{italian}{italian}{}
\HyLang@DeclareLang{magyar}{magyar}{}
\HyLang@DeclareLang{hungarian}{magyar}{}
\makeatother