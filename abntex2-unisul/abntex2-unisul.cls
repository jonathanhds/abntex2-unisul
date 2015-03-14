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
