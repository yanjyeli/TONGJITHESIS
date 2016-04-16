%%
%% This is file `tongjithesis.cls'.
%% 
%% Copyright (C) 2009- by Guanshi Li <gareth.cn@gmail.com>, TongjiLUG <lugtongji@googlegroups.com>
%% and 
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3a
%% of this license or (at your option) any later version.
%% The latest version of this license is in:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% and version 1.0 or later is part of all distributions of LaTeX
%% version 2004/10/01 or later.
%% 
%% 

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{tongjithesis}
[2009/05/13 1.0 Tongji University Thesis Template]
\newif\iftongji@UTF
\newif\iftongji@GBK
\DeclareOption{utf}{\tongji@UTFtrue\tongji@GBKfalse}
\DeclareOption{gbk}{\tongji@GBKtrue\tongji@UTFfalse}
\hyphenation{Thu-Thesis}
\def\thuthesis{\textsc{ThuThesis}}
\hyphenation{Tongji-Thesis}
\def\tongjithesis{\textsc{TongjiThesis}}
\def\version{1.0}
\newif\iftongji@master\tongji@masterfalse
\newif\iftongji@doctor\tongji@doctorfalse
\newif\iftongji@secret\tongji@secretfalse
\DeclareOption{master}{\tongji@mastertrue}
\DeclareOption{doctor}{\tongji@doctortrue}
\DeclareOption{secret}{\tongji@secrettrue}
\newif\iftongji@dvips
\newif\iftongji@dvipdfm
\newif\iftongji@xetex
\newif\iftongji@pdftex
\DeclareOption{dvips}{\tongji@dvipstrue}
\DeclareOption{dvipdfm}{\tongji@dvipdfmtrue}
\DeclareOption{pdftex}{\tongji@pdftextrue}
\DeclareOption{xetex}{\tongji@xetextrue}
\newif\iftongji@arial
\DeclareOption{arial}{\tongji@arialtrue}
\newif\iftongji@arialtoc
\DeclareOption{arialtoc}{\tongji@arialtoctrue}
\newif\iftongji@arialtitle
\DeclareOption{arialtitle}{\tongji@arialtitletrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ExecuteOptions{gbk,arialtitle}
\ProcessOptions\relax
\LoadClass[12pt,a4paper,openany]{book}
  \iftongji@master\relax\else
    \iftongji@doctor\relax\else
      \ClassError{tongjithesis}%
                 {You have to specify one of thesis options:  master or doctor.}{}
    \fi
  \fi
\RequirePackage{ifpdf,ifxetex}
\iftongji@xetex\RequireXeTeX\fi
\def\RequirePDFTeX{%
  \ifpdf\else
    \ClassError{tongjithesis}%
               {pdflatex is required to compile this document!}{}
  \fi}
\iftongji@pdftex\RequirePDFTeX\fi
\def\tongji@checkoption#1#2{%
  \@for\reserved@a:=#2\do{%
    \csname iftongji@\reserved@a\endcsname
      \ClassError{tongjithesis}%
                 {Please remove `\reserved@a' option when you run #1.}{}
    \fi}}
\ifpdf\tongji@checkoption{pdflatex}{dvips,dvipdfm,xetex}\tongji@pdftextrue\fi % force the option to be true
\ifxetex\tongji@checkoption{xelatex}{dvips,dvipdfm,pdftex}\tongji@xetextrue\fi
\RequirePackage{ifthen,calc}
\RequirePackage{amsmath,amssymb}
\RequirePackage{txfonts}
\RequirePackage{graphicx}
\RequirePackage[config]{subfig}
\RequirePackage{indentfirst}
\RequirePackage[neverdecrease]{paralist}
\iftongji@xetex
  \RequirePackage{xunicode,xltxtra}
  \RequirePackage[CJKnumber,CJKtextspaces,CJKmathspaces]{xeCJK}
  \punctstyle{kaiming}
  % todo: minor fix of CJKnumb
  \def\CJK@null{\kern\CJKnullspace\Unicode{48}{7}\kern\CJKnullspace}
  \defaultfontfeatures{Mapping=tex-text} % after fontspec
  \setCJKmainfont[BoldFont={Adobe Heiti Std}, ItalicFont={Adobe Kaiti Std}]{Adobe Song Std}
  \setCJKsansfont{Adobe Heiti Std}
  \setCJKmonofont{Adobe Kaiti Std}
  \setCJKfamilyfont{song}{Adobe Song Std}
  \setCJKfamilyfont{hei}{Adobe Heiti Std}
  \setCJKfamilyfont{fs}{Adobe Fangsong Std}
  \setCJKfamilyfont{kai}{Adobe Kaiti Std}
  \setCJKfamilyfont{li}{Adobe Kaiti Std} % todo: 用隶书字体代替
  \setCJKfamilyfont{you}{Adobe Kaiti Std} % todo: 用幼圆字体代替

  \setmainfont{Times New Roman}
  \setsansfont{Arial}
  \setmonofont{Courier New}
\else
  \RequirePackage{CJK}
  \RequirePackage{CJKnumb}
  \iftongji@GBK % CJKpunct 在 UTF 下工作的不好。
    \IfFileExists{CJKpunct.sty}%
                 {\RequirePackage{CJKpunct}}%
                 {\ClassWarning{tongjithesis}{no CJKpunct.sty availiable!}}
  \fi
  \RequirePackage{CJKspace}
  \iftongji@arial
    \IfFileExists{arial.sty}%
                 {\RequirePackage{arial}}%
                 {\ClassWarning{tongjithesis}{no arial.sty availiable!}}
  \fi
\fi
\iftongji@dvips\else
  \iftongji@xetex\else
    \RequirePackage{ccmap}
  \fi
\fi
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage[numbers,super,sort&compress]{natbib}
\RequirePackage{hyperref}
\ifxetex
  \hypersetup{%
    CJKbookmarks=true}
\else
  \hypersetup{%
    unicode=true,
    CJKbookmarks=true}
\fi
\hypersetup{%
  bookmarksnumbered=true,
  bookmarksopen=true,
  bookmarksopenlevel=1,
  breaklinks=true,
  colorlinks=false,
  plainpages=false,
  pdfpagelabels,
  pdfborder=0 0 0}
\iftongji@dvips
  \RequirePackage{breakurl}
\fi
\urlstyle{same}
\RequirePackage{hypernat}
\renewcommand\frontmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{tongji@empty}}
\renewcommand\mainmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{tongji@headings}}
\renewcommand\backmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue}
\newcommand{\song}{\CJKfamily{song}}    % 宋体
\def\songti{\song}
\newcommand{\fs}{\CJKfamily{fs}}        % 仿宋体
\def\fangsong{\fs}
\newcommand{\kai}{\CJKfamily{kai}}      % 楷体
\def\kaishu{\kai}
\newcommand{\hei}{\CJKfamily{hei}}      % 黑体
\def\heiti{\hei}
\newcommand{\li}{\CJKfamily{li}}        % 隶书
\def\lishu{\li}
\newcommand{\you}{\CJKfamily{you}}      % 幼圆
\def\youyuan{\you}
\newlength\tongji@linespace
\newcommand{\tongji@choosefont}[2]{%
   \setlength{\tongji@linespace}{#2*\real{#1}}%
   \fontsize{#2}{\tongji@linespace}\selectfont}
\def\tongji@define@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][\baselinestretch]{%
    \tongji@choosefont{##1}{#2}}}
\tongji@define@fontsize{chuhao}{42bp}
\tongji@define@fontsize{xiaochu}{36bp}
\tongji@define@fontsize{yihao}{26bp}
\tongji@define@fontsize{xiaoyi}{24bp}
\tongji@define@fontsize{erhao}{22bp}
\tongji@define@fontsize{erhaoban}{20bp}
\tongji@define@fontsize{xiaoer}{18bp}
\tongji@define@fontsize{sanhao}{16bp}
\tongji@define@fontsize{xiaosan}{15bp}
\tongji@define@fontsize{sihao}{14bp}
\tongji@define@fontsize{banxiaosi}{13bp}
\tongji@define@fontsize{xiaosi}{12bp}
\tongji@define@fontsize{dawu}{11bp}
\tongji@define@fontsize{wuhao}{10.5bp}
\tongji@define@fontsize{xiaowu}{9bp}
\tongji@define@fontsize{liuhao}{7.5bp}
\tongji@define@fontsize{xiaoliu}{6.5bp}
\tongji@define@fontsize{qihao}{5.5bp}
\tongji@define@fontsize{bahao}{5bp}
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12bp}{20bp}
  \abovedisplayskip=10bp \@plus 2bp \@minus 2bp
  \abovedisplayshortskip=10bp \@plus 2bp \@minus 2bp
  \belowdisplayskip=\abovedisplayskip
  \belowdisplayshortskip=\abovedisplayshortskip}
\AtBeginDvi{\special{papersize=\the\paperwidth,\the\paperheight}}
\AtBeginDvi{\special{!%
      \@percentchar\@percentchar BeginPaperSize: a4
      ^^Ja4^^J\@percentchar\@percentchar EndPaperSize}}
\setlength{\textwidth}{\paperwidth}
\setlength{\textheight}{\paperheight}
\setlength\marginparwidth{0cm}
\setlength\marginparsep{0cm}
\addtolength{\textwidth}{-6.4cm}
\setlength{\oddsidemargin}{3.2cm-1in}
\setlength{\evensidemargin}{\oddsidemargin}
\setlength{\headheight}{20pt}
\setlength{\topskip}{0pt}
\setlength{\skip\footins}{15pt}
\setlength{\topmargin}{2.8cm-1in}
\setlength{\footskip}{1.5cm}
\setlength{\headsep}{0.5cm}
\addtolength{\textheight}{-8.6cm}
\let\tongji@cleardoublepage\cleardoublepage
\newcommand{\tongji@clearemptydoublepage}{%
  \clearpage{\pagestyle{empty}\tongji@cleardoublepage}}
\let\cleardoublepage\tongji@clearemptydoublepage
\def\ps@tongji@empty{%
  \let\@oddhead\@empty%
  \let\@evenhead\@empty%
  \let\@oddfoot\@empty%
  \let\@evenfoot\@empty}
\def\ps@tongji@plain{%
  \let\@oddhead\@empty%
  \let\@evenhead\@empty%
  \def\@oddfoot{\hfil\wuhao\thepage\hfil}%
  \let\@evenfoot=\@oddfoot}
\def\ps@tongji@headings{%
  \def\@oddhead{\vbox to\headheight{%
      \hb@xt@\textwidth{\hfill\wuhao\song\leftmark\hfill}%
      \vskip2pt\hbox{\vrule width\textwidth height0.4pt depth0pt}}}
  \def\@evenhead{\vbox to\headheight{%
      \hb@xt@\textwidth{\wuhao\song%
      \hfill\leftmark\hfill}%
      \vskip2pt\hbox{\vrule width\textwidth height0.4pt depth0pt}}}
  \def\@oddfoot{\hfil\wuhao\thepage\hfil}
  \let\@evenfoot=\@oddfoot}
\renewcommand{\chaptermark}[1]{\@mkboth{\@chapapp\  ~~#1}{}}
\newlength\CJK@twochars
\ifxetex
  \def\CJK@spaceChar{\Unicode{48}{7}}
\else
  \iftongji@UTF
    \def\CJK@spaceChar{\CJKchar{"080}{"080}}
  \fi
  \iftongji@GBK
    \def\CJK@spaceChar{\CJKchar{"0A1}{"0A1}}
  \fi
\fi
\def\CJKindent{%
  \settowidth\CJK@twochars{\CJK@spaceChar\CJK@spaceChar}%
  \parindent\CJK@twochars}
\setlength{\parskip}{0pt \@plus2pt \@minus0pt}
\def\tongji@item@space{%
  \let\itemize\compactitem
  \let\enditemize\endcompactitem
  \let\enumerate\compactenum
  \let\endenumerate\endcompactenum
  \let\description\compactdesc
  \let\enddescription\endcompactdesc}
\newcommand*\MakePerPage[2][\@ne]{%
  \expandafter\def\csname c@pchk@#2\endcsname{\c@pchk@{#2}{#1}}%
  \newcounter{pcabs@#2}%
  \@addtoreset{pchk@#2}{#2}}
\def\new@pagectr#1{\@newl@bel{pchk@#1}}
\def\c@pchk@#1#2{\z@=\z@
  \begingroup
  \expandafter\let\expandafter\next\csname pchk@#1@\arabic{pcabs@#1}\endcsname
  \addtocounter{pcabs@#1}\@ne
  \expandafter\ifx\csname pchk@#1@\arabic{pcabs@#1}\endcsname\next
  \else \setcounter{#1}{#2}\fi
  \protected@edef\next{%
    \string\new@pagectr{#1}{\arabic{pcabs@#1}}{\noexpand\thepage}}%
  \protected@write\@auxout{}{\next}%
  \endgroup\global\z@}
\MakePerPage{footnote}
\def\tongji@textcircled#1{%
  \ifnum \value{#1} <10 \textcircled{\xiaoliu\arabic{#1}}
  \else\ifnum \value{#1} <100 \textcircled{\qihao\arabic{#1}}\fi
  \fi}
\renewcommand{\thefootnote}{\tongji@textcircled{footnote}}
\renewcommand{\thempfootnote}{\tongji@textcircled{mpfootnote}}
\def\footnoterule{\vskip-3\p@\hrule\@width0.3\textwidth\@height0.4\p@\vskip2.6\p@}
\let\tongji@footnotesize\footnotesize
\renewcommand\footnotesize{\tongji@footnotesize\xiaowu[1.5]}
\def\@makefnmark{\textsuperscript{\hbox{\normalfont\@thefnmark}}}
\long\def\@makefntext#1{
    \bgroup
      \setbox\@tempboxa\hbox{%
        \hb@xt@ 2em{\@thefnmark\hss}}
      \leftmargin\wd\@tempboxa
      \rightmargin\z@
      \linewidth \columnwidth
      \advance \linewidth -\leftmargin
      \parshape \@ne \leftmargin \linewidth
      \footnotesize
      \@setpar{{\@@par}}%
      \leavevmode
      \llap{\box\@tempboxa}%
      #1
    \par\egroup}
\allowdisplaybreaks[4]
\gdef\@endtrivlist#1{%  % from \endtrivlist
  \if@inlabel \indent\fi
  \if@newlist \@noitemerr\fi
  \ifhmode
    \ifdim\lastskip >\z@ #1\unskip \par  %<<<<<<<<<<<<<<<<<<<<<<
      \else #1\unskip \par \fi
  \fi
  \if@noparlist \else
    \ifdim\lastskip >\z@
       \@tempskipa\lastskip \vskip -\lastskip
      \advance\@tempskipa\parskip \advance\@tempskipa -\@outerparskip
      \vskip\@tempskipa
    \fi
    \@endparenv
  \fi #1}
\theorembodyfont{\song\rmfamily}
\theoremheaderfont{\hei\rmfamily}
\setlength{\floatsep}{12bp \@plus4pt \@minus1pt}
\setlength{\intextsep}{12bp \@plus4pt \@minus2pt}
\setlength{\textfloatsep}{12bp \@plus4pt \@minus2pt}
\setlength{\@fptop}{0bp \@plus1.0fil}
\setlength{\@fpsep}{12bp \@plus2.0fil}
\setlength{\@fpbot}{0bp \@plus1.0fil}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
\let\old@tabular\@tabular
\def\tongji@tabular{\dawu[1.5]\old@tabular}
\DeclareCaptionLabelFormat{tongji}{{\dawu[1.5]\song #1~\rmfamily #2}}
\DeclareCaptionLabelSeparator{tongji}{\hspace{1em}}
\DeclareCaptionFont{tongji}{\song\wuhao[1]}
\captionsetup{labelformat=tongji,labelsep=tongji,font=tongji}
\captionsetup[table]{position=top,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[figure]{position=bottom,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[subfloat]{labelformat=simple,font=tongji,captionskip=6bp,nearskip=6bp,farskip=0bp,topadjust=0bp}
\renewcommand{\thesubfigure}{(\alph{subfigure})}
\renewcommand{\thesubtable}{(\alph{subtable})}
\let\tongji@LT@array\LT@array
\def\LT@array{\dawu[1.5]\tongji@LT@array} % set default font size
\def\hlinewd#1{%
  \noalign{\ifnum0=`}\fi\hrule \@height #1 \futurelet
    \reserved@a\@xhline}
\iftongji@arialtitle
  \def\tongji@title@font{\sffamily}
\fi
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi\phantomsection%
                    \thispagestyle{tongji@headings}%
                    \global\@topnum\z@%
                    \@afterindenttrue%
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
   \if@mainmatter
     \refstepcounter{chapter}%
     \addcontentsline{toc}{chapter}{\protect\numberline{\@chapapp}#1}%TODO: shit
   \else
     \addcontentsline{toc}{chapter}{#1}%
   \fi
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \@makechapterhead{#2}}
\def\@makechapterhead#1{%
  \vspace*{20bp}%
  {\parindent \z@ \centering
    \hei\bfseries\csname tongji@title@font\endcsname\sanhao[1]
    \ifnum \c@secnumdepth >\m@ne
      \@chapapp\hskip1em
    \fi
    #1\par\nobreak
    \vskip 24bp}}
\def\@schapter#1{%
  \@makeschapterhead{#1}
  \@afterheading}
\def\@makeschapterhead#1{%
  \vspace*{20bp}%
  {\parindent \z@ \centering
   \hei\csname tongji@title@font\endcsname\sanhao[1]
     \def\@tempa{#1}
     \def\@tempb{\eabstractname}
     \ifx\@tempa\@tempb\bfseries\fi
   \interlinepenalty\@M
   #1\par\nobreak
   \vskip 24bp}}
\newcounter{tongji@bookmark}
\def\tongji@chapter*{%
  \@ifnextchar [ % ]
    {\tongji@@chapter}
    {\tongji@@chapter@}}
\def\tongji@@chapter@#1{\tongji@@chapter[#1]{#1}}
\def\tongji@@chapter[#1]#2{%
  \@ifnextchar [ % ]
    {\tongji@@@chapter[#1]{#2}}
    {\tongji@@@chapter[#1]{#2}[]}}
\def\tongji@@@chapter[#1]#2[#3]{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \phantomsection
  \def\@tmpa{#1}
  \def\@tmpb{#3}
  \ifx\@tmpa\@empty
    \addtocounter{tongji@bookmark}\@ne
    \pdfbookmark[0]{#2}{tongjichapter.\thetongji@bookmark}
  \else
    \addcontentsline{toc}{chapter}{#1}
  \fi
  \chapter*{#2}
  \ifx\@tmpb\@empty
    \@mkboth{#2}{#2}
  \else
    \@mkboth{#3}{#3}
  \fi}
\renewcommand\section{\@startsection {section}{1}{\z@}%
                     {-24bp\@plus -1ex \@minus -.2ex}%
                     {6bp \@plus .2ex}%
                     {\hei\csname tongji@title@font\endcsname\sihao[1.429]}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                        {-16bp\@plus -1ex \@minus -.2ex}%
                        {6bp \@plus .2ex}%
                        {\hei\csname tongji@title@font\endcsname\banxiaosi[1.538]}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                           {-16bp\@plus -1ex \@minus -.2ex}%
                           {6bp \@plus .2ex}%
                           {\hei\csname tongji@title@font\endcsname\xiaosi[1.667]}}
\setcounter{secnumdepth}{3}
\iftongji@doctor
  \setcounter{tocdepth}{2}
\else
  \setcounter{tocdepth}{3}
\fi
\renewcommand\tableofcontents{%
  \tongji@chapter*[]{\lcontentsname}[\contentsname]
  \xiaosi[1.5]\@starttoc{toc}\normalsize}
\iftongji@arialtoc
  \def\tongji@toc@font{\sffamily}
\fi
\def\@pnumwidth{2em} % 这个参数没用了
\def\@tocrmarg{2em}
\def\@dotsep{1} % 目录点间的距离
\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
    \parindent #2\relax\@afterindenttrue
    \interlinepenalty\@M
    \leavevmode
    \@tempdima #3\relax
    \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
    {\csname tongji@toc@font\endcsname #4}\nobreak
    \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
    \nobreak{\normalfont \normalcolor #5}%
    \par}%
  \fi}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 4bp \@plus\p@
    \setlength\@tempdima{4em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      {\hei\csname tongji@toc@font\endcsname #1} % numberline is called here, and it uses \@tempdima
      \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
      \nobreak{\normalfont\normalcolor #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\renewcommand*\l@section{\@dottedtocline{1}{1.2em}{2.1em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{2em}{3em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{3.5em}{3.8em}}
\def\tongji@define@term#1{
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname tongji@#1\endcsname{##1}}
  \csname #1\endcsname{}}
\tongji@define@term{secretlevel}
\tongji@define@term{secretyear}
\tongji@define@term{ctitle}
\tongji@define@term{cdegree}
\newcommand\cdepartment[2][]{\def\tongji@cdepartment@short{#1}\def\tongji@cdepartment{#2}}
\def\caffil{\cdepartment} % todo: for compatibility
\def\tongji@cdepartment@short{}
\def\tongji@cdepartment{}

\tongji@define@term{cmajorfirst}
\def\csubject{\cmajorfirst} % for compatibility
\tongji@define@term{cmajorsecond}
\def\csubject{\cmajorsecond} % for compatibility

\tongji@define@term{cauthor}
\tongji@define@term{csupervisor}
\tongji@define@term{cassosupervisor}
\tongji@define@term{ccosupervisor}
\tongji@define@term{cdate}
\tongji@define@term{cfunds}
\tongji@define@term{efunds}
\tongji@define@term{etitle}
\tongji@define@term{edegree}
\tongji@define@term{edepartment}
\def\eaffil{\edepartment} % todo: for compability
\tongji@define@term{emajorfirst}
\def\esubject{\emajorfirst} % todo: for compability
\tongji@define@term{emajorsecond}
\def\esubject{\emajorsecond} % todo: for compability
\tongji@define@term{eauthor}
\tongji@define@term{esupervisor}
\tongji@define@term{eassosupervisor}
\tongji@define@term{ecosupervisor}
\tongji@define@term{edate}
\long\@xp\def\@xp\collect@@body\@xp#\@xp1\@xp\end\@xp#\@xp2\@xp{%
  \collect@@body{#1}\end{#2}}
\long\@xp\def\@xp\push@begins\@xp#\@xp1\@xp\begin\@xp#\@xp2\@xp{%
  \push@begins{#1}\begin{#2}}
\long\@xp\def\@xp\addto@envbody\@xp#\@xp1\@xp{%
  \addto@envbody{#1}}
\newcommand{\tongji@@cabstract}[1]{\long\gdef\tongji@cabstract{#1}}
\newenvironment{cabstract}{\collect@body\tongji@@cabstract}{}
\newcommand{\tongji@@eabstract}[1]{\long\gdef\tongji@eabstract{#1}}
\newenvironment{eabstract}{\collect@body\tongji@@eabstract}{}
\def\tongji@parse@keywords#1{
  \expandafter\gdef\csname tongji@#1\endcsname{} % todo: need or not?
  \expandafter\gdef\csname #1\endcsname##1{
    \@for\reserved@a:=##1\do{
      \expandafter\ifx\csname tongji@#1\endcsname\@empty\else
        \expandafter\g@addto@macro\csname tongji@#1\endcsname{\ignorespaces\csname tongji@#1@separator\endcsname}
      \fi
      \expandafter\expandafter\expandafter\g@addto@macro%
        \expandafter\csname tongji@#1\expandafter\endcsname\expandafter{\reserved@a}}}}
\tongji@parse@keywords{ckeywords}
\tongji@parse@keywords{ekeywords}
\newlength{\tongji@title@width}
\def\tongji@put@title#1{\makebox{\hb@xt@ \tongji@title@width{#1}}}
\newcommand{\tongji@first@titlepage}{
  \begin{center}
    \vspace*{0.4cm}
    \parbox[b][1.8cm][t]{\textwidth}{%
      \hspace*{11.2cm}\iftongji@secret{\sanhao\tongji@secret@title}\else\rule{1cm}{0cm}\fi\\[0.1cm]
      \hspace*{-0.1cm}\includegraphics[scale=0.16]{tongjilogo.png}}
          \parbox[t][9cm][t]{\paperwidth-10cm}{
      \renewcommand{\baselinestretch}{1}
      \begin{center}
            \sanhao[1]{\tongji@capply}\par\vskip 1.4cm
            \yihao[2]\textbf{\hei\tongji@ctitle}\par\vskip 17pt
     \ifx\cfunds\@empty\else
            \xiaosi{\tongji@cfunds}
             \par\vskip 20bp\fi
      \end{center}}
       \vskip -0.1cm
      \hspace*{1.5cm}\parbox[t][8.5cm][t]{\textwidth}{{\sanhao[1.5]
        \begin{center}\fs
          \setlength{\tongji@title@width}{6em}
          \setlength{\extrarowheight}{4pt}
          \ifxetex % todo: ugly codes
      \begin{tabular}{p{\tongji@title@width}@{}c@{\extracolsep{8pt}}p{7cm}l}
          \else
      \begin{tabular}{p{\tongji@title@width}c@{\extracolsep{8pt}}p{7cm}l}
          \fi
              \tongji@put@title{\tongji@cdepartmenttitle}  & \tongji@title@sep & {\ziju{3bp}\tongji@cdepartment}\\
              \tongji@put@title{\tongji@cmajortitlefirst}       & \tongji@title@sep & {\ziju{3bp}\tongji@cmajorfirst}\\
              \tongji@put@title{\tongji@cmajortitlesecond} & \tongji@title@sep & {\ziju{3bp}\tongji@cmajorsecond}\\
              \tongji@put@title{\tongji@cauthortitle}      & \tongji@title@sep & {\ziju{3bp}\tongji@cauthor}\\
              \tongji@put@title{\tongji@csupervisortitle}  & \tongji@title@sep & {\ziju{3bp}\tongji@csupervisor}\\
              \ifx\tongji@cassosupervisor\@empty\else
          \tongji@put@title{\tongji@cassosupertitle} & \tongji@title@sep & {\ziju{3bp}\tongji@cassosupervisor}\\
              \fi
              \ifx\tongji@ccosupervisor\@empty\else
                \tongji@put@title{\tongji@ccosupertitle}   & \tongji@title@sep & {\ziju{3bp}\tongji@ccosupervisor}\\
              \fi
            \end{tabular}
        \end{center}}}
     \begin{center}
       {\sanhao \song \tongji@cdate}
     \end{center}
    \end{center}} % end of titlepage

\newcommand{\engcover}{%
\begin{center}
    \vspace*{0.4cm}
    \parbox[b][1.8cm][t]{\textwidth}{%
      \hspace*{11.2cm}\iftongji@secret{\sanhao\tongji@secret@title}\else\rule{1cm}{0cm}\fi\\[-0.1cm]
      \hspace*{-0.1cm}\includegraphics[scale=0.16]{tongjilogo.png}}
      \vskip -0.9cm
    \parbox[t][9cm][t]{\paperwidth-6cm}{
      \renewcommand{\baselinestretch}{1}
      \begin{center}
            \sihao[1.3]{\bfseries\sffamily\tongji@eapply}\par\vskip 1.4cm
            \erhaoban[1.5]\textbf{\bfseries\sffamily\tongji@etitle}\par\vskip 14pt
            \ifx\efunds\@empty\else\xiaosi[1.3]{\tongji@efunds}
             \par\vskip 20bp\fi
      \end{center}}
       \vskip 0.5cm
      \hspace*{1.6cm}\parbox[t][8.7cm][t]{\textwidth}{\sanhao[1.5]
        \begin{center}
        \begin{tabular}{lp{7cm}l}
          School/Department :& \tongji@edepartment\\
          Discipline : & \tongji@emajorfirst\\
          Major : & \tongji@emajorsecond\\
          Candidate :& \tongji@eauthor\\ 
              Supervisor : & \tongji@esupervisor\\
        \ifx\tongji@eassosupervisor\@empty
          \else Associate Supervisor : & \tongji@eassosupervisor\\\fi
        \ifx\tongji@ecosupervisor\@empty
          \else Cooperate Supervisor : & \tongji@ecosupervisor\\\fi
      \end{tabular}
    \end{center}}
     \begin{center}
       \sanhao\bfseries\sffamily\tongji@edate
     \end{center}
\end{center}} % end of english cover

\newcommand\tongji@underline[2][6em]{\hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt}

\newcommand{\tongji@declareshortname@mk}{%
 \vspace*{-0.1cm} % shit code!
  \begin{center}\erhao\hei\tongji@declarename\end{center}
  \vskip18pt\sihao[2.03]\par
  \tongji@declaretext\par
 \vskip8.9cm
    \begingroup
      \parindent0pt\xiaosi
      \hspace*{5.5cm}\tongji@authorsig\relax\hspace*{1cm}\\[3pt]
      \hspace*{9.5cm}\tongji@date\relax\hspace*{1cm}
    \endgroup}

\newcommand{\tongji@authorization@mk}{%
 \vspace*{-0.1cm} % shit code!
  \begin{center}\erhao\hei\tongji@authtitle\end{center}
  \vskip18pt\sihao[2.03]\par
  \tongji@authorization\par
 \vskip7.9cm
    \begingroup
      \parindent0pt\xiaosi
      \hspace*{5.5cm}\tongji@authorsig\relax\hspace*{1cm}\\[3pt]
      \hspace*{9.5cm}\tongji@date\relax\hspace*{1cm}
    \endgroup}

\newcommand{\makecover}{
  \phantomsection
  \pdfbookmark[-1]{\tongji@ctitle}{ctitle}
  \normalsize%
  \begin{titlepage}
    \tongji@first@titlepage
    \cleardoublepage\engcover
    \cleardoublepage\tongji@authorization@mk
    \cleardoublepage\tongji@declareshortname@mk
  \end{titlepage}
  \normalsize
  \tongji@makeabstract
  \let\@tabular\tongji@tabular}
\newcommand{\tongji@makeabstract}{%
  \cleardoublepage % always openright for Abstract
  \tongji@chapter*[]{\cabstractname} % no tocline
  \pagestyle{tongji@headings}  
  \pagenumbering{Roman}
  \tongji@cabstract
  \vskip12bp
  \setbox0=\hbox{{\hei\tongji@ckeywords@title}}
  \noindent\hangindent\wd0\hangafter1
    \box0\tongji@ckeywords
  \tongji@chapter*[]{\eabstractname} % no tocline
  \tongji@eabstract
  \vskip12bp
  \setbox0=\hbox{\textbf{Key words:\enskip}}
  \noindent\hangindent\wd0\hangafter1
    \box0\tongji@ekeywords}
\newenvironment{denotation}[1][2.5cm]{
  \tongji@chapter*[]{\tongji@denotation@name} % no tocline
  \noindent\begin{list}{}%
    {\vskip-30bp\xiaosi[1.6]
     \renewcommand\makelabel[1]{##1\hfil}
     \setlength{\labelwidth}{#1} % 标签盒子宽度
     \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
     \setlength{\itemindent}{0cm} % 标签缩进量
     \setlength{\leftmargin}{\labelwidth+\labelsep} % 左边界
     \setlength{\rightmargin}{0cm}
     \setlength{\parsep}{0cm} % 段落间距
     \setlength{\itemsep}{0cm} % 标签间距
    \setlength{\listparindent}{0cm} % 段落缩进量
    \setlength{\topsep}{0pt} % 标签与上文的间距
   }}{\end{list}}
\newenvironment{ack}{%
     % \cleardoublepage
    \tongji@chapter*[\tongji@acklongname]{\tongji@ackname}[\tongji@acklongname]
  }
  
\def\tongji@starttoc#1{% #1: float type, prepend type name in \listof*** entry.
  \let\oldnumberline\numberline
  \def\numberline##1{\oldnumberline{\csname #1name\endcsname\hskip.4em ##1}}
  \@starttoc{\csname ext@#1\endcsname}
  \let\numberline\oldnumberline}
\def\tongji@listof#1{% #1: float type
  \@ifstar
    {\tongji@chapter*[]{\csname list#1name\endcsname}\tongji@starttoc{#1}}
    {\tongji@chapter*{\csname list#1name\endcsname}\tongji@starttoc{#1}}}
\renewcommand\listoffigures{\tongji@listof{figure}}
\renewcommand*\l@figure{\@dottedtocline{1}{0em}{4em}}
\renewcommand\listoftables{\tongji@listof{table}}
\let\l@table\l@figure
\def\ext@equation{loe}
\def\equcaption#1{%
  \addcontentsline{\ext@equation}{equation}%
                  {\protect\numberline{#1}}}
\newcommand\listofequations{\tongji@listof{equation}}
\let\l@equation\l@figure
\bibpunct{[}{]}{,}{s}{}{,}
\renewcommand\NAT@citesuper[3]{\ifNAT@swa%
  \unskip\kern\p@\textsuperscript{\NAT@@open #1\NAT@@close}%
  \if*#3*\else\ (#3)\fi\else #1\fi\endgroup}
\DeclareRobustCommand\onlinecite{\@onlinecite}
\def\@onlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}
\def\tongjidot{\unskip.}
\def\tongjimasterbib{\iftongji@doctor [M]\else [Master Thesis]\fi}
\def\tongjiphdbib{\iftongji@doctor [D]\else [Doctor Thesis]\fi}
\renewenvironment{thebibliography}[1]{%
   \tongji@chapter*{\bibname}%
   \wuhao[1.5]
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\renewcommand{\makelabel}[1]{##1\hfill}
         \settowidth\labelwidth{1.1cm}
         \setlength{\labelsep}{0.4em}
         \setlength{\itemindent}{0pt}
         \setlength{\leftmargin}{\labelwidth+\labelsep}
         \addtolength{\itemsep}{-0.7em}
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \sloppy\frenchspacing
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000%
    \interlinepenalty4000%
    \sfcode`\.\@m}
   {\def\@noitemerr
     {\@latex@warning{Empty `thebibliography' environment}}%
    \endlist\frenchspacing}
\let\tongji@appendix\appendix
\renewenvironment{appendix}{%
  \tongji@appendix
  \gdef\@chapapp{\appendixname~\thechapter}
  }{}
\newenvironment{resume}{%
  % \cleardoublepage
  \tongji@chapter*{\tongji@resume@title}}{}
\newcommand{\resumeitem}[1]{\vspace{2.5em}{\sihao\hei\centerline{#1}}\par}
\iffalse
\newcommand{\bs}{\symbol{'134}}%Print backslash
\newcommand{\cih}[1]{%
  \index{commands!#1@\texttt{\bs#1}}%
  \index{#1@\texttt{\hspace*{-1.2ex}\bs #1}}}
\newcommand{\ci}[1]{\cih{#1}\texttt{\bs#1}}
\newcommand{\pai}[1]{%
  \index{packages!#1@\textsf{#1}}%
  \index{#1@\textsf{#1}}%
  \textsf{#1}}
\newcommand{\ei}[1]{%
  \index{environments!\texttt{#1}}%
  \index{#1@\texttt{#1}}%
  \texttt{#1}}
\newcommand{\wi}[1]{\index{#1}#1}
\fi
\newcommand*{\ziju}[1]{\renewcommand{\CJKglue}{\hskip #1}}
\newcommand{\pozhehao}{\kern0.3ex\rule[0.8ex]{2em}{0.1ex}\kern0.3ex}
\def\tongji@active@cjk{
  % Activate all >128 characters.
  \count@=127
  \@whilenum\count@<255 \do{%
    \advance\count@ by 1
    \lccode`\~=\count@
    \catcode\count@=\active
    \lowercase{\def~{\kern1ex}}}}
\AtEndOfClass{\ifxetex\else\tongji@active@cjk\fi\input{tongjithesis.cfg}}
\def\tongji@fixselectfont{%
  \ifx\@EverySelectfont@EveryHook\@undefined\else% everysel package is loaded
    \DeclareRobustCommand{\selectfont}{%
       \ifx\f@linespread\baselinestretch \else
          \set@fontsize\baselinestretch\f@size\f@baselineskip \fi
       \xdef\font@name{%
          \csname\curr@fontshape/\f@size\endcsname}%
       \pickup@font
       \font@name
       % CJK addition:
       \CJK@bold@false
       \csname \curr@fontshape\endcsname
       % everysel addition:
       \@EverySelectfont@EveryHook
       \@EverySelectfont@AtNextHook
       \gdef\@EverySelectfont@AtNextHook{}%
       % end additions
       \size@update
       \enc@update}
  \fi}
\def\tongji@setup@pdfinfo{%
  \hypersetup{%
    pdftitle={\tongji@ctitle},
    pdfauthor={\tongji@cauthor},
    pdfsubject={\tongji@cdegree},
    pdfkeywords={\tongji@ckeywords},
    pdfcreator={\tongji@cauthor},
    pdfproducer={\tongjithesis}}}
\ifxetex
  \AtBeginDocument{\CJKindent}
\else
  \def\tongji@beginCJK{%
    \tongji@fixselectfont%
    \begin{CJK*}{GBK}{song}\CJKindent}
  \def\tongji@endCJK{\clearpage\end{CJK*}}
  \let\tongji@begindocumenthook\@begindocumenthook
  \let\tongji@enddocumenthook\@enddocumenthook
  \def\AtBeginDocument{\g@addto@macro\tongji@begindocumenthook}
  \def\AtEndDocument{\g@addto@macro\tongji@enddocumenthook}
  \def\@begindocumenthook{\tongji@begindocumenthook\tongji@beginCJK}
  \def\@enddocumenthook{\tongji@endCJK\tongji@enddocumenthook}
\fi
\AtEndOfClass{\sloppy\tongji@item@space}
\endinput
%%
%% End of file `tongjithesis.cls'.
