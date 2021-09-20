\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uofathesis}[2021/06/01]


% Define some options vars
\newif\if@domestic
\@domestictrue
\newif\if@published
\@publishedfalse


\DeclareOption{international}{		% Excludes statement regarding Aus Gov funding
    \@domesticfalse
    }	

\DeclareOption{published}{		% Includes additional statement regarding copyright
    \@publishedtrue
    }

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[12pt,a4paper]{book}

\usepackage{datetime}

% new dateformat to include only month and year
\newdateformat{monthyear}{%
  \monthname[\THEMONTH] \THEYEAR}

\newdateformat{daymonthyear}{%
  \THEDAY/\THEMONTH/\THEYEAR}


% define some args
\def\titlesize#1{\gdef\@titlesize{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\department#1{\gdef\@department{#1}}
\def\school#1{\gdef\@school{#1}}
\def\date#1{\gdef\@date{#1}}
\def\uofa{The University of Adelaide}

% Have useful default headings
\pagestyle{headings}
\let\MakeUppercase\textsf

% call to inlude statement of authorship
\def\published#1{
    \begin{figure}[!ht]
        \thispagestyle{plain}
        \includegraphics[width=1\textwidth]{#1}
    \end{figure}
  }

  \renewcommand{\maketitle}{\begin{titlepage}
    \begin{center}
    \includegraphics{UoA_logo_col_vert} \par

    \vfil

    {\@titlesize\bf \@title \par}
    \vskip 1\baselineskip
    {\Large by\par}
    \vskip 1\baselineskip
    {\LARGE \@author \par}

    \vfil

    In fulfilment of the requirements for the degree of \par
    \vskip 1\baselineskip
    {\Large\bf \@degree \par}
    \vskip 0.5\baselineskip
    {\large \monthyear\today \par} 

    \vfil

    {\large \@department \par}
    \vskip 0.5\baselineskip
    {\large \@school \par}
    \vskip 1\baselineskip
    {\large\bf \uofa \par}
    \vfil

    \end{center}\par
    \end{titlepage}}

\def\makedeclaration{
    \chapter{Declaration}
    {\parindent=0pt\parskip=2ex
    
    I certify that this work contains no material which has been accepted for the award of any other degree or diploma in my name, in any university or other tertiary institution and, to the best of my knowledge and belief, contains no material previously published or written by another person, except where due reference has been made in the text. In addition, I certify that no part of this work will, in the future, be used in a submission in my name, for any other degree or diploma in any university or other tertiary institution without the prior approval of the University of Adelaide and where applicable, any partner institution responsible for the joint-award of this degree. 

    \if@published
    I acknowledge that copyright of published works contained within this thesis resides with the copyright holder(s) of those works. 
    \fi
    
    I \if@published also \fi give permission for the digital version of my thesis to be made available on the web, via the University’s digital research repository, the Library Search and also through web search engines, unless permission has been granted by the University to restrict access for a period of time.
    
    \if@domestic 
    I acknowledge the support I have received for my research through the provision of an Australian Government Research Training Program Scholarship.
    \fi

    \vskip 4\baselineskip
    \hfil\large\@author\hfil\daymonthyear\today\hfil

    }
}

\newenvironment{abstract}{
  {\small\textbf{Abstract} }
  \par\vspace{0.5\baselineskip}\noindent\ignorespaces
}{}

\newcommand\chaptersubtitle[1]{
    \vspace{-2\baselineskip}
    {\Large\bf\itshape#1\par}
    \vspace{2\baselineskip}
    \noindent\ignorespaces
}


\newcommand\changelocaltocdepth[1]{%
  \addtocontents{toc}{\protect\setcounter{tocdepth}{#1}}%
  \setcounter{tocdepth}{#1}%
}


\newenvironment{introduction}{
    \chapter*{Introduction}
    \addcontentsline{toc}{chapter}{Introduction}\markboth{Introduction}{}
}{\clearpage}


\newenvironment{conclusions}{
    \chapter*{Conclusions}
    \addcontentsline{toc}{chapter}{Conclusions}\markboth{Conclusions}{}
}{\clearpage}