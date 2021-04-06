%%
%% 'sociologos.cls', for SOCIOLOGOS and SOCIOLOGOS Review of Books.
%%
%% Contact: slogos @ l.u-tokyo.ac.jp
%% 				MilkySocioHolmes @ gmail.com
%%
%% http://www.l.u-tokyo.ac.jp/~slogos/
%% http://www.l.u-tokyo.ac.jp/~slogos/review_sociologos/
%%
%% [HISTORY]
%% 2018/04/08 ver 0.90
%% 2018/04/09 ver 0.91
%% 		package replacements, fonts substitution for otf package, new 'notabularx' option, encoding = UTF-8 unicode, \begin{huki} command for additional remarks.
%% 2018/04/10 ver 0.92
%%    new 'reviewessay' options and commands for SOCIOLOGOS Review of Books.
%% 2018/04/13 ver 0.93
%%    new options for authors and reviewers.
%% 2018/04/15 ver 0.94
%%	  'nocheckutf' option.
%% 2018/04/22 ver 0.95
%% 	  debugged 'quote' environment.
%% 2018/04/24 ver 0.96
%% 2018/04/28 ver 0.97
%% 2018/05/04 ver 0.98
%%    'references' environment. OLDfootnote.
%%    new 'authorinfo' 'authorinfoii' 'authorinfoiii' 'authorinfoiv' 'authorinfov' commands for multiple authors.

\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{sociologos}
  [2018/04/08 SOCIOLOGOS]
  
\newcommand\tombowmemo{2nd\_block\_copy\space}
\renewcommand\tombowmemo\@empty

% basic forms
\newcommand{\subtitle}[1]{%
 \gdef\@subtitle{%
#1}}
\newcommand{\authorinfo}[3]{%
 \gdef\@authorinfo{%
（{#1}、{#2}、{#3}）}}
\let\@authorinfo\@empty
\newcommand{\authorinfoii}[3]{%
 \gdef\@authorinfoii{%
（{#1}、{#2}、{#3}）}}
\let\@authorinfoii\@empty
\newcommand{\authorinfoiii}[3]{%
 \gdef\@authorinfoiii{%
（{#1}、{#2}、{#3}）}}
\let\@authorinfoiii\@empty
\newcommand{\authorinfoiv}[3]{%
 \gdef\@authorinfoiv{%
（{#1}、{#2}、{#3}）}}
\let\@authorinfoiv\@empty
\newcommand{\authorinfov}[3]{%
 \gdef\@authorinfov{%
（{#1}、{#2}、{#3}）}}
\let\@authorinfov\@empty
\authorinfo{ひらがな氏名}{所属}{メールアドレス}

\newcommand{\reviewer}[2]{%
 \gdef\@reviewer{%
{#1}、{#2}}}
\let\@reviewer\@empty

\newcommand{\figcap}[1]{%
\par\noindent\raggedright\small\hspace{0zw} {#1}}

\newcommand{\tabcap}[1]{%
\par\noindent\raggedright\small\hspace{0zw} {#1}}

\newcommand{\issuenum}[1]{%
 \gdef\@issuenum{%
#1}}
\let\@issuenum\@empty
\newcommand{\issueyear}[1]{%
 \gdef\@issueyear{%
#1}}
\issuenum{XX}
\issueyear{20XX}

\newcommand{\englishtitle}[1]{%
 \gdef\@englishtitle{%
#1}}
\newcommand{\englishsubtitle}[1]{%
 \gdef\@englishsubtitle{%
#1}}
\newcommand{\englishauthor}[1]{%
 \gdef\@englishauthor{%
#1}}
\newcommand{\abst}[1]{%
 \gdef\@abst{%
#1}}
\let\@abst\@empty
\newcommand{\englishabst}[1]{%
 \gdef\@englishabst{%
#1}}
\let\@englishabst\@empty

\newcommand{\sociologosfooter}{ソシオロゴス}
\newcommand{\reviewessayhead}{}

\newif\if@jfont
\@jfontfalse
\newif\if@jsc@uplatex
\@jsc@uplatexfalse
\newif\if@reviewessay
\@reviewessayfalse
\newif\if@nocheckutf
\@nocheckutffalse

% options: jfont, notabularx, uplatex, tombow are available.
\DeclareOption{jfont}{% to use IPA fonts for Japanese characters.
\@jfonttrue}
\DeclareOption{reviewessay}{% for "SOCIOLOGOS review of books."
\@reviewessaytrue}
\DeclareOption{nocheckutf}{% to disable 'inputenc' package.
\@nocheckutftrue}
\DeclareOption{uplatex}{% if you are running upLaTeX engine.
\@jsc@uplatextrue}
\DeclareOption{tombow}{% to show crop marks (jsarticle)
  \tombowtrue \tombowdatetrue
  \setlength{\@tombowwidth}{.1\p@}%
  \@bannertoken{%
    \jobname\space\tombowmemo(\number\year-\two@digits\month-\two@digits\day
    )}%
  \maketombowbox}
\ProcessOptions

\if@nocheckutf
\else
\RequirePackage[utf8]{inputenc}
\fi

\if@jfont
\RequirePackage[ipaex]{pxchfon}
\fi

\if@jsc@uplatex
  \RequirePackage[uplatex,deluxe]{otf}
	\DeclareFontShape{JY2}{hgt}{m}{it}{<->ssub*gt/m/n}{}
	\DeclareFontShape{JT2}{hgt}{m}{it}{<->ssub*gt/m/n}{}
	\DeclareFontShape{JY2}{hgt}{bx}{it}{<->ssub*gt/bx/n}{}
	\DeclareFontShape{JT2}{hgt}{bx}{it}{<->ssub*gt/bx/n}{}
 	\DeclareFontShape{JY2}{hmc}{m}{it}{<->ssub*mc/m/n}{}
	\DeclareFontShape{JT2}{hmc}{m}{it}{<->ssub*mc/m/n}{}
	\DeclareFontShape{JY2}{hmc}{bx}{it}{<->ssub*mc/bx/n}{}
	\DeclareFontShape{JT2}{hmc}{bx}{it}{<->ssub*mc/bx/n}{}
\else
  \RequirePackage[deluxe]{otf}
	\DeclareFontShape{JY1}{hgt}{m}{it}{<->ssub*gt/m/n}{}
	\DeclareFontShape{JT1}{hgt}{m}{it}{<->ssub*gt/m/n}{}
	\DeclareFontShape{JY1}{hgt}{bx}{it}{<->ssub*gt/bx/n}{}
	\DeclareFontShape{JT1}{hgt}{bx}{it}{<->ssub*gt/bx/n}{}
 	\DeclareFontShape{JY1}{hmc}{m}{it}{<->ssub*mc/m/n}{}
	\DeclareFontShape{JT1}{hmc}{m}{it}{<->ssub*mc/m/n}{}
	\DeclareFontShape{JY1}{hmc}{bx}{it}{<->ssub*mc/bx/n}{}
	\DeclareFontShape{JT1}{hmc}{bx}{it}{<->ssub*mc/bx/n}{}
\fi

% reviewessay option
\if@reviewessay
\newcommand{\bookauthor}[1]{%
 \gdef\@bookauthor{%
#1}}
\let\@bookauthor\@empty
\newcommand{\bookyear}[1]{%
 \gdef\@bookyear{%
#1}}
\let\@bookyear\@empty
\newcommand{\booktitle}[1]{%
 \gdef\@booktitle{%
#1}}
\let\@booktitle\@empty
\newcommand{\bookenglishtitle}[1]{%
 \gdef\@bookenglishtitle{%
#1}}
\let\@bookenglishtitle\@empty
\newcommand{\publisher}[1]{%
 \gdef\@publisher{%
#1}}
\let\@publisher\@empty
\newcommand{\booktitleelse}[1]{%
 \gdef\@booktitleelse{%
#1}}
\let\@booktitleelse\@empty
\newcommand{\bookimage}[1]{%
 \gdef\@bookimage{%
#1}}
\let\@bookimage\@empty

\renewcommand{\sociologosfooter}{書評ソシオロゴス}
\renewcommand{\reviewessayhead}{\@author「\@title」}



% Review essay header (book info)
\newcommand{\reviewessayheader}{\par
      \begingroup
        \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
  	\def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
      \long\def\@makefntext##1{\advance\leftskip 3zw
          \parindent 1zw\noindent
          \llap{\@textsuperscript{\normalfont\@thefnmark}\hskip0.3zw}##1}%
        \if@twocolumn
          \ifnum \col@number=\@ne
            \@reviewessayheader
          \else
            \twocolumn[\@reviewessayheader]%
          \fi
        \else
          \global\@topnum\z@  % Prevents figures from going at top of page.
          \@reviewessayheader
        \fi
      \endgroup
      \setcounter{footnote}{0}%
      \setcounter{endnote}{0}%
      \setcounter{section}{0}%
      \setcounter{table}{0}%
      \setcounter{figure}{0}%
    }
    \def\@reviewessayheader{%
      \centering
        \begin{tabular}[t]{"p{0.92\textwidth}"}%
        \begin{minipage}{.65\textwidth}
            {\Huge REVIEW ESSAY \par}%
            \vspace{2\Cvs}
            \@bookauthor、\@bookyear \\
           \ifx \@booktitleelse\empty
            \ifx \@bookenglishtitle\empty
           『\@booktitle』\\
            \else
            \emph{\@bookenglishtitle} \\
            \fi
          \else
          \@booktitleelse \\
          \fi
            \@publisher%
        \end{minipage}%
        \hspace{0.05\textwidth}%
        \begin{minipage}{.22\textwidth}
          \centering
          \ifx \@bookimage\empty
          \else
          \includegraphics[width=\linewidth]{\@bookimage}
          \fi
        \end{minipage}%
        \end{tabular}\par%
        \vskip 1.5em
    }
\else

\fi

% Load jsarticle.cls
\if@jsc@uplatex
  \LoadClass[b5paper,10pt,onecolumn,twoside,uplatex]{jsarticle}%
  \else
  \LoadClass[b5paper,10pt,onecolumn,twoside]{jsarticle}%
\fi

% \maketitle
\renewcommand{\maketitle}{\par
    \begingroup
      \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
      \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
      \long\def\@makefntext##1{\advance\leftskip 3zw
        \parindent 1zw\noindent
        \llap{\@textsuperscript{\normalfont\@thefnmark}\hskip0.3zw}##1}%
      \if@twocolumn
        \ifnum \col@number=\@ne
          \@maketitle
        \else
          \twocolumn[\@maketitle]%
        \fi
      \else
        \global\@topnum\z@  % Prevents figures from going at top of page.
        \@maketitle
      \fi
    \endgroup
    \setcounter{footnote}{0}%
    \setcounter{endnote}{0}%
    \setcounter{section}{0}%
    \setcounter{table}{0}%
    \setcounter{figure}{0}%
  }
  \def\@maketitle{%
    \begin{center}%
      {\LARGE \bf \@title \par}%
      \ifx \@subtitle\empty
      \relax
      \else
      {\large ------\@subtitle ------}
        \fi
      \vskip 1.5em
    \end{center}%
    \begin{flushright}
    \rightskip=5zw
    {\Large \@author}
    \end{flushright}
    \ifx \@abst\empty
    \relax
    \else
    \par\vspace{-1.5\Cvs}
    \begin{onecolabstract}
    \@abst
    \end{onecolabstract}
    \fi
  }

% \makeenglishtitle
\newcommand{\makeenglishtitle}{\par
      \begingroup
        \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
        \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
        \long\def\@makefntext##1{\advance\leftskip 3zw
          \parindent 1zw\noindent
          \llap{\@textsuperscript{\normalfont\@thefnmark}\hskip0.3zw}##1}%
        \if@twocolumn
          \ifnum \col@number=\@ne
            \@makeenglishtitle
          \else
            \twocolumn[\@makeenglishtitle]%
          \fi
        \else
          \global\@topnum\z@  % Prevents figures from going at top of page.
          \@makeenglishtitle
        \fi
      \endgroup
      \setcounter{footnote}{0}%
    }
    \def\@makeenglishtitle{%
    \noindent\begin{minipage}{\textwidth}
    \parindent=1zw
      \begin{center}%
        \ifx \@englishsubtitle\empty
        {\Large \bf \setstretch{0.7} \@englishtitle \par}%
        \else
        {\Large \bf \setstretch{0.7} \@englishtitle : \par}%
        {\large \@englishsubtitle}%
          \fi
        \vskip 1em
      \end{center}%
      \begin{flushright}
      {\normalsize\it\@englishauthor}
      \end{flushright}
      \par
      \ifx \@englishabst\empty
      \relax
      \end{minipage}
      \else
      {\normalfont \@englishabst}
      \end{minipage}
      \clearpage
      \fi
    }

% credits
    \newcommand{\credits}{\vspace{\baselineskip}
          \begingroup
                \@makecredits
          \endgroup
        }
        \def\@makecredits{%
          \begin{flushright}%
            \ifx \@authorinfo\empty
            \else
              \ifx \@authorinfoii\empty
              \@authorinfo \par
              \else
                \ifx \@authorinfoiii\empty
                \@authorinfo \par
                \@authorinfoii \par
                \else
                  \ifx \@authorinfoiv\empty
                  \@authorinfo \par
                  \@authorinfoii \par
                  \@authorinfoiii \par
                  \else
                    \ifx \@authorinfov\empty
                    \@authorinfo \par
                    \@authorinfoii \par
                    \@authorinfoiii \par
                    \@authorinfoiv \par
                    \else
                    \@authorinfo \par
                    \@authorinfoii \par
                    \@authorinfoiii \par
                    \@authorinfoiv \par
                    \@authorinfov \par
                    \fi
                  \fi
                \fi
              \fi
            \fi
            \ifx \@reviewer\empty
            （査読者\quad）
            \else
            （査読者\quad\@reviewer）
            \fi
          \end{flushright}
          \vspace{10pt}
          \let\@authorinfoi\@empty
          \let\@authorinfoii\@empty
          \let\@authorinfoiii\@empty
          \let\@authorinfoiv\@empty
          \let\@authorinfov\@empty
        }

% section, subsection, subsubsection style
\renewcommand{\thesection}{\presectionname\@arabic\c@section\postsectionname}
\renewcommand{\thesubsection}{\@arabic\c@section--\@arabic\c@subsection}
\renewcommand{\thesubsubsection}{%
   \@arabic\c@section--\@arabic\c@subsection--\@arabic\c@subsubsection}
\renewcommand{\section}{%
  \@startsection{section}{1}{\z@}%
  {0.75\Cvs \@plus.25\Cvs \@minus.1\Cvs}%
  {0.75\Cvs \@plus.25\Cvs \@minus.1\Cvs}%
  {\large\bf\sf}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
  {0.75\Cvs \@plus.25\Cvs \@minus.1\Cvs}{0pt}%
  {\normalsize\sf}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
  {\Cvs}{0pt}%
  {\normalsize}}

%acknowledgement
\newenvironment{ackn}[1]%
{\subsection*{\normalsize\sf 謝辞} #1}%

%additional remarks
\newenvironment{huki}[1]%
{\subsection*{\normalsize\sf 付記} #1}%

% \bibliosection{} heading style
\def\bibliosection{\@startsection {section}{1}{\z@}{\baselineskip}{\z@}{\large\bf\sf}}

% references environment
\newenvironment{references}{%
\bibliosection*{文献}\begin{hangparas}{2zw}{1}%
}{%
\end{hangparas}}

% redefining quotation
\renewenvironment{quotation}{%
\list{}{%
\listparindent\parindent
\itemindent\listparindent
\leftmargin=2zw}%
\item\relax}{\endlist}

\renewenvironment{quote}%
{\list{}{\leftmargin2zw}\item\relax}{\endlist}

% Declaring Packages
\RequirePackage[b5j, top=18truemm, bottom=26truemm, left=21truemm, right=21truemm]{geometry}
\RequirePackage{bxpapersize}
\RequirePackage{fancyhdr,float,booktabs,hanging,array}
\RequirePackage{newtxtext,newtxmath}
\RequirePackage{makecell}
\RequirePackage{setspace}
\RequirePackage{url}
\urlstyle{same}
\RequirePackage{times}
\RequirePackage[dvipdfmx]{graphicx}
\RequirePackage{titlesec,amsmath,multirow,multicol,endnotes}
\RequirePackage{silence}
\WarningFilter{caption}{Unsupported document class}

\RequirePackage[font={small,sf,bf}, labelsep=quad, format=hang, justification=raggedright]{caption}
\RequirePackage{abstract}
\setlength{\absleftindent}{2zw}
\setlength{\absrightindent}{2zw}

\setlength\textfloatsep{5pt}
\setlength\belowcaptionskip{0pt}
\setlength\abovecaptionskip{5pt}

% endnotes(footnotes) style (require 'endnotes' package)
\let\OLDfootnote=\footnote
\let\footnote=\endnote
\renewcommand{\thefootnote}{\arabic{footnote}}
\renewcommand{\theendnote}{\arabic{endnote}}
% \patchcmd{\enoteformat}{1.8em}{6pt}{}{}
\renewcommand{\enotesize}{\small}
\def\notesname{注}%
\def\enoteheading{\bibliosection*{\notesname
\@mkboth{\MakeUppercase{\notesname}}{\MakeUppercase{\notesname}}}%
\mbox{}\par\vskip-\baselineskip}
\def\enoteformat{%
  \rightskip\z@ \leftskip1.3zw \parindent=1zw
  \leavevmode{\setbox\z@=\lastbox}\llap{\theenmark\enskip}%
}

\newcommand\dfill{\leavevmode \cleaders \hb@xt@ .44em{\hss ・\hss }\hfill \kern \z@}

% footers
\lfoot[\sf\thepage]{\sf \sociologosfooter\hspace{1zw}NO.\@issuenum／\@issueyear}
\rfoot[\sf \sociologosfooter\hspace{1zw}NO.\@issuenum／\@issueyear]{\sf\thepage}
\cfoot{}
\lhead[]{\sf\reviewessayhead}
\rhead[\sf\reviewessayhead]{}
\renewcommand{\headrulewidth}{0.0pt}
\renewcommand{\abstractname}{}

\pagestyle{fancy}

\let\OLDitemize\itemize
\renewcommand\itemize{\OLDitemize\setlength{\leftskip}{0.42cm}}

\newcolumntype{"}{@{\hskip\tabcolsep\vrule width 3pt\hskip\tabcolsep}}



\endinput
%%
