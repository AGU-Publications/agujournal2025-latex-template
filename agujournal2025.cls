%% change

\def\currversion{October 22, 2024}

  %****************************************************************%
  %*                                                              *%
  %*  AGU Class File for all AGU Journals                         *%
  %*                                                              *%
  %*  Written by Amy Hendrickson                                  *%
  %*  TeXnology Inc.: 617 738-8029                                *%ƒ
  %*  amyh@texnology.com                                          *%
  %*  http://www.texnology.com                                    *%
  %*                                                              *%
  %****************************************************************%

%%% Updates by Dangerous Curve  typesetting@dangerouscurve.org
%%%
%%%  2017-07-14
%%%      (Changes marked DC)
%%%
%%%      Use BibLaTeX for change to APA style.
%%%      Removed tracking-changes code.
%%%
%%%
%%%  2017-12-16
%%%
%%%    Remove biblatex.
%%%    Use apacite instead of agufull08,

%%%  2018-07-17 / NRV
%%%  thanks to John Haiducek for help with citep error

%%% 2019-01-14 / NRV
%%% Removed natbib, changed instructions for cite commands, added Appendix heading

%%% 2019-4-16 / NRV
%%% Removed ulem to facilitate trackchanges
%%% Gave user more control over trackchanges options
%%% fixed typo in example citations

%%%  2024-10-21 / DC
%%%
%%%    Added ``published'' option and rough typsetting of Wiley published output
%%%

%%% 2024-11-21 / DC
%%% Added more left-hand column items to published version.


\ProvidesClass{agujournal2025}
              %[01/14/2019]
       [11/12/2024]


 % If the user calls with ``published'' then use the Wiley as-published class. DC
\newif\ifpub
%
\DeclareOption{published}{\global\pubtrue}
\ProcessOptions


% If want published Wiley style.
\ifpub
\typeout{IF published^^J}


%% Below two lines have to be in the top 10 lines of the file.  Leaving here for documentation.
%!TEX TS-program = xelatex
%!TEX encoding = UTF-8 Unicode


%%xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

%% Set in Wiley style.

%% Below two lines have to be in the top 10 lines of the file.  Leaving here for documentation.
%!TEX TS-program = xelatex
%!TEX encoding = UTF-8 Unicode
%
 % OR anywhere near the top. . .
 %
%\RequireXeTeX %Force XeTeX check

\LoadClass[oneside]{article}
%
\RequirePackage{xstring}
\RequirePackage{graphicx}
\RequirePackage[strict]{changepage}
\RequirePackage{etoolbox}
\RequirePackage{textcomp} % for copyright sign
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
%\RequirePackage{tweaklist}  % Has a bug in it.  Fixed below.
\RequirePackage{tweaklist-git-moderncv-fixed}
\RequirePackage{fancyvrb}  % So can use \begin{Verbatim}. . .\end{Verbatim} if want.
\RequirePackage[x11names]{xcolor}
\RequirePackage{ifthen}
\RequirePackage{xifthen}
\RequirePackage{listofitems}
\RequirePackage{expl3}
\RequirePackage{trimspaces}
\RequirePackage{placeins}
\RequirePackage{calc}
\RequirePackage{enumitem}
%\RequirePackage{spacing}

%%%
\parindent=0pt
\parskip=.5pc


%% Set journal name:
\def\journalname#1{\def\thejournalname{#1}}
\journalname{Please set Journal Name by using {\tt\string\journalname}}



%  Bibliography section
%
% Need BibLaTeX for APA style.  DC
%    NRV removed the above.
%
%
% Add a margin par to the bibliography's section command.
%
\newcommand{\bibpagemarginpar}{%
    \reversemarginpar\marginpar{%
        \marginminipage{12pt}{% Geometry. Do not change.
           \raggedright
           \vspace*{12pt}
           \firstpagemarginentry{Acknowledgements}{%\textcolor{red}
            {Your acknowledgements will appear here.}}           % Need a hook-in?
          \vfill
      }
   }
}



\RequirePackage{apacite}
%\RequirePackage{natbib}
\let\cite\shortcite % So get et al. with three authors the first time.
%\let\citep\cite %xx A natbib command.
\let\citet\shortciteA %xx Ditto.
%
\bibliographystyle{apacite}

%
% Change bib type size.
\renewcommand\bibliographytypesize{\footnotesize}

\renewcommand{\bibliographyprenote}{\bibpagemarginpar}

% Indentation of the second and subsequent lines of a reference list entry, relative to the usual left margin.
\setlength{\bibleftmargin}{10pt}

% Indentation of the first line of a reference list entry, relative to the second line; default  -\bibleftmargin.
\setlength{\bibindent}{-\bibleftmargin} % Just to make sure.

% Vertical separation between two reference list entries.  Default value “0pt plus .3pt”
\setlength{\bibitemsep}{-3pt}

% Vertical separation between two paragraphs within the same reference list entry.
\setlength{\bibparsep}{3pt}

%\biblabelsep


\RequirePackage{url}


%% Table Footnotes

\newdimen\saveparskip %xxxx
\saveparskip=\parskip

\newdimen\saveparindent
\saveparindent=\parindent


\def\tablenotemark#1{\rlap{$^{\rm #1}$}}   %xxxx
\def\tablenotemark#1{}   % Undo above.

\long\def\tablenotetext#1#2{\vtop{\vspace2pt   %xxxx
\uncentering\noindent\setbox0=\hbox{#1}%
\hskip\saveparindent\ifdim\wd0>1pt
$^{\rm #1}$ \fi{\tablenotefont\ignorespaces #2}\vspace1sp}}
%
\def\tablenotetext#1#2{}  % Undo above.

\long\def\tablecomments#1{\vbox{\uncentering  %xxxx
\vspace2pt{\parindent\saveparindent\def\\ {\vspace1sp}\tablenotefont #1}
\vspace 1sp}}

\let\tablecomment\tablecomments  %xxxx  allowing these?
\def\tablenotes{\uncentering\vspace4pt   %xxxx
\tablenotefont\noindent\hskip\saveparindent\ignorespaces}
\def\endtablenotes{\vspace1sp}

\def\uncentering{%   %xxxx
  \let\\\@normalcr
  \rightskip0pt \leftskip0pt
  \parindent\saveparskip \parfillskip0pt plus 1fil\relax}



\def\articlenumber{\phantom{\small XX.XX/XX/XXXXEAXXXXXX}}  % Bogus sample number.  Made invisible by request.


% Some definitions used in all styles.
%
\def\authorrunninghead#1{}
\def\titlerunninghead#1{}%{\def\therunningheadtitle{#1}}  % Ignored in sample published version.


%
\def\title#1{\def\thetitle{#1}}
\def\authors#1{\def\theauthors{#1} \makeinitialedfirstauthor}
\def\authoraddr#1{\def\theauthoraddr{#1}}
%
%
\newcounter{affiliationcounter} \setcounter{affiliationcounter}{0}
%
% Note: the default command \affil #1->$^{#1}$\ignorespaces
\def\affiliation#1#2{%
    \stepcounter{affiliationcounter} %\theaffiliationcounter (prints counter value)
    \appto{% Add command to \authoraffiliations hook
        \theauthoraffiliations}{$^{#1}$#2\ }
}


%
%  Key Points
\newcommand{\printnonemptyitem}[1]{%
      \makeatletter
      \sbox0{#1}%
      \ifdim0pt=\dimexpr\wd0+\ht0+\dp0%=0pt % Check width + height + depth is zero; handles spaces.
                                       \relax
      \else
%            \item #1
          \apptocmd{\thekeypoints}{\item #1}
      \fi
      \makeatother
} % end \printnonemptyitem
%
\newcommand{\thekeypoints}{%
    \vspace*{-9pt}
    \begin{itemize}
}

\def\keypoints#1#2#3{%
        \printnonemptyitem{#1}
        \printnonemptyitem{#2}
        \printnonemptyitem{#3}
    \apptocmd{\thekeypoints}{\end{itemize} }
}
\def\citation#1{\def\thecitation{#1}}


\RequirePackage{marginnote}


%  Fonts
% https://tex.stackexchange.com/questions/43806/what-does-font-name-in-the-fontspec-package-refer-to-on-a-mac
%\usepackage[T1]{fontenc}
\usepackage{amsmath}
\usepackage{fontspec}
\defaultfontfeatures{Ligatures=TeX}
\usepackage{xltxtra}
\usepackage{xunicode}
\usepackage{unicode-math}
%
%
\setmathfont{STIX Two Math Regular}[
%% Extension={.otf},
%% Path=./,
Scale=1]
%
\def\STIXTwo{%
\setmainfont{STIX Two Text}[
%% Extension={.otf},
%% Path=./,
UprightFont={* Regular},
BoldFont={* Bold},
ItalicFont={* Italic},
BoldItalicFont={* Bold Italic}]
}
\STIXTwo


\setsansfont[%% Path=./,
  Mapping=tex-text, Scale=.9]{FreeSans}
\setmonofont[%% Path=./, 
  Mapping=tex-text, Scale=1.05]{FreeMono}

%% Set the font sizes and baselines to match Wiley's journal.
%
% The font sizes
%
\makeatletter
\renewcommand\normalsize{% 9/12     (main text; see also variations: author list 9/10.8, subsections down to paragraph 9/11)
   \@setfontsize\normalsize{9}{12}%
   \abovedisplayskip 8.5pt \@plus3pt \@minus4pt
   \abovedisplayshortskip0pt \@plus2pt
   \belowdisplayshortskip 4pt \@plus2pt \@minus2pt
   \let\@listi\@listI
}   %
\normalbaselineskip=12pt
\normalsize

% Leading variation on normalsize
\newcommand\authornormalsize{% 9/10.6   (author list)
   \@setfontsize\authornormalsize{9}{10.8}%
   \abovedisplayskip 8.5pt \@plus3pt \@minus4pt
   \abovedisplayshortskip0pt \@plus2pt
   \belowdisplayshortskip 4pt \@plus2pt \@minus2pt
   \let\@listi\@listI
}   %


% small
\renewcommand\small{% 8/10
   \@setfontsize\small{8}{10}%%
%   \abovedisplayskip 6pt \@plus2pt \@minus4pt
%   \abovedisplayshortskip 0pt \@pluspt
%   \belowdisplayshortskip 3pt \@pluspt \@minus2pt
%   \def\@listi{\leftmargin\leftmargini
%               \topsep 3pt \@pluspt \@minuspt
%               \parsep 2pt \@pluspt \@minuspt
%               \itemsep \parsep}%
%   \belowdisplayskip \abovedisplayskip
}

% footnotesize
\renewcommand\footnotesize{% 7/9
   \@setfontsize\footnotesize{7}{9}%
%   \abovedisplayskip 5pt \@plus2pt \@minus3pt
%   \abovedisplayshortskip 0pt \@pluspt
%   \belowdisplayshortskip 3pt \@pluspt \@minus2pt
%   \def\@listi{\leftmargin\leftmargini
%               \topsep 3pt \@pluspt \@minuspt
%               \parsep 2pt \@pluspt \@minuspt
%               \itemsep \parsep}%
%   \belowdisplayskip \abovedisplayskip
}

% scriptsize
\renewcommand\scriptsize{\@setfontsize\scriptsize{7}{8}} % 7/8
%
\newcommand\bibscriptsize{\@setfontsize\scriptsize{7}{9}} % 7/9    % scriptsize with different leading.    % But this is footnotesize
% tiny
\renewcommand\tiny{\@setfontsize\tiny{5}{6}}% 5/6
% large
\renewcommand\large{\@setfontsize\large{11}{12}} % 11/12    (section, back matter heads)
% Large
\renewcommand\Large{\@setfontsize\Large{12}{12}} % 12/12   (abstract heads)
% LARGE
\renewcommand\LARGE{\@setfontsize\LARGE{14}{16}} % 14/16
% huge
\renewcommand\huge{\@setfontsize\huge{15}{18}} % 15/18   (title)
% Huge
\renewcommand\Huge{\@setfontsize\Huge{22}{22}} % 22/22   (journal name)

\makeatother


% The fonts using the above sizes
%
\newcommand{\authornormalfont}{\normalfont\authornormalsize\bfseries}
\newcommand{\titlefont}{\normalfont\huge\bfseries}
\newcommand{\headerjournalfont}{\normalfont\LARGE\bfseries}
\newcommand{\abstractheadfont}{\normalfont\Large\bfseries}
\newcommand{\sectionfont}{\normalfont\large\bfseries}  % (subsections down to paragraph 9/11)
\newcommand{\subsectionfont}{\normalfont\normalsize\bfseries}
\newcommand{\authorfootnotesandtablesfont}{\normalfont\small\rmfamily}  % (author footnote, tables, table footnotes)
\newcommand{\marginparreferencesfont}{\normalfont\footnotesize\rmfamily}
\newcommand{\marginparreferencesheadsfont}{\normalfont\footnotesize\bfseries}  % (margin pars, references)
\let\captionfont\marginparreferencesfont
\let\captionlabelfont\marginparreferencesheadsfont
\let\tablenotefont\captionfont
%
\newcommand{\journalfont}{\Huge\fontspec{texgyreadventor-bold.otf}}


\gdef\fontblue{SlateBlue4}




%% Set page layout geometry.
% If change values, look for hard-wired instances of values (e.g., in \maketitle.)
%
\newlength{\topamount}  \setlength{\topamount}{40pt} %52pt}  %4pc, last measure says 62pt
\newlength{\headsepamount}  \setlength{\headsepamount}{1pc} %1pc,
\newlength{\headheightamount}  \setlength{\headheightamount}{27.65pt} %27.65pt,
%
\RequirePackage[%
letterpaper,
%asymmetric,
%
% Horizontal
bindingoffset=0pt,
left=14.5pc,   % 3pc space on left, 2pc on right, so margin text box should be 9.5pc.
right=3pc,
textwidth=32.25pc,  % 33.5pc,
marginparsep=.5pc, % Larger number moves margin par text box to left.
marginparwidth=11pc, % 11.5pc,
%
% Vertical
%textheight=48pc,     % 50pc  Does not really change anything..
includehead,
includefoot,
top=\topamount,  % see \maketitle
headsep=\headsepamount,  % see \maketitle
headheight=\headheightamount,  % see \maketitle
footskip=2.5pc, % 2pc  % This shortens textheight from the bottom when increased.
bottom=2pc,
%
%showframe,
]{geometry}
%

% For lists.
\setlength\leftmargini   {1pc}
\setlength\leftmarginii  {1pc}
\setlength\leftmarginiii {1pc}
\setlength\leftmarginiv  {1pc}
\setlength\leftmarginv   {1pc}
\setlength\leftmarginvi  {1pc}
\setlength\labelsep      {.5pc}
\setlength\labelwidth    {\leftmargini}
\addtolength\labelwidth{-\labelsep}



% Margin pars
%
% Separation marginpars by 2 lines' worth of space.
\setlength\marginparpush{2\baselineskip}%{10pt}

% A minipage for margin pars, with adjustable vertical size.
%
% #1: minipage height
% #2: minipage contents
\newcommand{\marginminipage}[2]{%
    \vspace*{-20pt}
    %\fbox{%
    %%%%
    \begin{minipage}[t][#1][t]{9.5pc}%  % [vertical, size]{}{horizontal size}
        #2%
    \end{minipage}
   % }% end fbox
}



% Sections
%
%
% spec fonts, etc.
% Note: \dimen0=\fontdimen5\sectionfont  % x height

\makeatletter

\renewcommand\section{\@startsection {section}{1}{\z@}%
%                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
%                                   {.1ex \@plus.2ex}%
                                   {-26pt \@plus -1ex \@minus -.2ex}% Per specs.
                                   {1pt \@plus.2ex}%
                                   {\sectionfont\color{\fontblue}}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
%                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
%                                     {.1ex \@plus .2ex}%
                                     {-26pt \@plus -1ex \@minus -.2ex}% Per specs.
                                     {1pt \@plus.2ex}%
                                     {\subsectionfont \color{\fontblue}}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
%                                    {-3.25ex\@plus -1ex \@minus -.2ex}%
%                                    {.1ex \@plus .2ex}%
                                   {-26pt \@plus -1ex \@minus -.2ex}% Per specs.
                                   {1pt \@plus.2ex}%
                                   {\subsectionfont \color{\fontblue}}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3pt plus 1pt minus 1pt}%
                                    {-1em}%
                                    {\subsectionfont \color{\fontblue}}}
%\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
%                                       {3.25ex \@plus1ex \@minus .2ex}%
%                                       {-1em}%
%                                      {\authornormalsize}}
\makeatother


% Put a period after all section labels, e.g., ``1.2.'' instead of ``1.2''
\makeatletter
\renewcommand\@seccntformat[1]{\csname the#1\endcsname.\ }
\makeatother



% Build a version of the first author with leading initials instead of names.  NOT WORKING.
%
\newcommand{\makeinitialedfirstauthor}{}%
\newcommand{\firstauthorinitialedname}{}


% Headers and Footers
%
\usepackage{xpatch}

\pagestyle{fancy}
%
\xpretocmd\headrule{\color{\fontblue}}{}{\PatchFailed}
\xpretocmd\footrule{\color{\fontblue}}{}{\PatchFailed}
%
% Was: \show\footruleskip => .3 \normalbaselineskip => .3 12 * p   3.6pt
\renewcommand{\footruleskip}{12pt}
%
%
\fancyhf{} % clear all header and footer fields
\renewcommand{\headrulewidth}{1pt}
\renewcommand{\footrulewidth}{1pt}
%
% Make headers and footers go across the whole page.
% ignore compaints about the `e'.
\fancyheadoffset[loh,reh]{11.5pc}
\fancyfootoffset[loh,reh]{11.5pc}

%
% headers
\def\raiseamount{.5pc}  % Raises if positive.
%
\fancyhead[L]{\includegraphics[height=2pc]{./agu-logo-small.pdf}}  % In the right place.  Adjust the other two by \raiseamount.
\fancyhead[C]{
     \raisebox{\raiseamount}{
         \headerjournalfont
        \textcolor{\fontblue}{
             \thejournalname
          }
      }
}
\fancyhead[R]{\raisebox{\raiseamount}{\normalfont \textcolor{\fontblue}{\articlenumber}}}


%
% footers
\def\allfooters{%
    \normalfont
    \fancyfoot[L]{\textcolor{\fontblue}{\firstauthorinitialedname}}%allcaps}}
    \fancyfoot[R]{\textcolor{\fontblue}{\thepage\ of \pageref{LastPage}}}
}
\allfooters



% Abstract and Plain Language Summary    % Original abstract environment written from scratch in TeX.
%
\def\abstracthead#1{{\abstractheadfont \textcolor{\fontblue}{#1\ }}}
\def\abstractrule{{\color{\fontblue}\rule{\textwidth}{3pt}}}

\newenvironment{plainlanguagesummary}
    {
        \par
        \vspace*{6pt}
        \abstracthead{Plain Language Summary}
        \begingroup
        \raggedright
    }
    {
        \par
        \endgroup
    }

\renewenvironment{abstract}
    {
       {\color{\fontblue} \abstractrule}
        \par
        \vspace*{-2pt}
        \abstracthead{Abstract}
        \begingroup
         \raggedright
    }
    %  Put optional Abstract Body here, including the optional Plain Language Summary environment {plainlanguagesummary}.
    {
        \par
        \endgroup
        \vspace*{-6pt}
        \abstractrule
        \vspace*{-3pc}
    }


% Lists (not listings)
%
\newlength{\tweaktopskip}
\setlength{\tweaktopskip}{1pc  - \parskip}


% http://dcwww.camd.dtu.dk/~schiotz/comp/LatexTips/LatexTips.html
%
% Use tweaklist commands to change details of the itemize list.
\renewcommand{\itemhook}{\setlength{\topsep}{\tweaktopskip}}%

 % Use tweaklist commands to change details of the description list.
\renewcommand{\deschook}{\setlength{\topsep}{\tweaktopskip}}%

% Use tweaklist commands to change details of the enumerate list.
\renewcommand{\enumhook}{\setlength{\topsep}{\tweaktopskip}}%




 % Wide figures and tables simply go off the page.


% Full-page-width area
%
\def\fullwidthmarginoverhang{-11.5pc}
\def\absfullwidthmarginoverhang{11.5pc}
%
\newlength{\pagewidth}    \setlength{\pagewidth}{\textwidth}    \addtolength{\pagewidth}{\absfullwidthmarginoverhang}
%
\newenvironment{fullwidth}
    {
        % Widen left margin by width of margin text box plus marginpar.
        \begin{adjustwidth}{\fullwidthmarginoverhang}{}
        \let\oldtextwidth\textwidth
        \let\textwidth\pagewidth
    }
    {
        \let\textwidth\oldtextwidth
        \end{adjustwidth}
    }


%%%
%% Title block
%
% Some more author stuff (defined differently in non-Wiley) for title block.
% Replace \affil stuff with below, from agujournal.cls:    DC
%
\def\affil#1{$^{#1}$\ignorespaces}
\def\thanks#1{%xxx \textcolor{red}{
(#1)}%}   % Should be moved to affil.
%

\newcommand{\footnoteuseerror}{ERROR: AGU does not permit footnotes outside of the author affiliations.}
\renewcommand{\footnote}[1]{%
%%\ClassError {⟨class-name⟩} {⟨error-text⟩} {⟨help-text⟩}
    \typeout{^^J^^J \footnoteuseerror^^J^^J}
    \footnoteuseerror
}

\def\marginparentrysep{1pc}
%
\newcommand{\firstpagemarginentry}[2]{%
  \marginparreferencesheadsfont \textcolor{\fontblue}{#1:}\\
  \marginparreferencesfont #2 \leavevmode \\  % ``\ '' before \leavevmode would do just as well.
  \vspace*{\marginparentrysep}
}
%
\renewcommand{\maketitle}{%
      \newpage
      %
      % Suppress running head, not footers.
      \fancypagestyle{plain}{%
          \renewcommand{\headrulewidth}{0pt}%
          \fancyhf{}%
          \allfooters
      }%
      \thispagestyle{plain}
      %

      % Left margin par hangs off paper title.
      %
      \newcommand{\firstpagemarginpar}{%
            \reversemarginpar\marginpar{%
                 \marginminipage{44.75pc}{%
                       \raggedright
                       %
                       \vspace*{-14pt} % Adjust so top of next line is at the top of the title.
                       \sectionfont \textcolor{\fontblue}{RESEARCH ARTICLE}\par
                       \vspace*{2pt}
                       \normalfont \articlenumber\par
                       \vspace*{\marginparentrysep}
                      %
                       \firstpagemarginentry{Key Points}{\thekeypoints}   % Hook in?
                      \vspace*{-6pt}                       \firstpagemarginentry{Correspondence to}{\theauthoraddr}
                       \firstpagemarginentry{Citation}{Your citation here.}   % Wiley does this.

% Per AGU request, removed everything commented out except \vfill.
                         % Received: XX XXX, XXXX\\
                         % Accepted: XX XXX, XXXX\\
                         % \vspace*{\marginparentrysep}

%                       \firstpagemarginentry{Author Contributions}{%
%                           \textcolor{red}{List of %hook in?
%                           author(s) in bold followed by a colon; contribution in regular font.\\
%                           No extra space between entries. One author per line.}
%                       }
                       \vfill
%                       \marginparreferencesfont
%                           \begingroup
%                           \color{\fontblue} \textcopyright\ XXXX The Authors. Earth and Space Science published by Wiley Periodicals LLC on behalf of American Geophysical Union.
%
%                                This is an open access article under the terms of the Creative Commons Attribution-NonCommercial-NoDerivs License, which permits use and   distribution in any medium, provided the original work is properly cited, the use is non-commercial and no modifications or adaptations are made.
%                          \endgroup
              }   % end marginminipage
          } % end reversemarginpar/marginpar
      } % end firstmarginpar



       \newlength{\firstpagelogoheight}   \setlength{\firstpagelogoheight}{2pc}
       \gdef\typesetfirstpagelogo{\rightline{\includegraphics[height=\firstpagelogoheight]{./agu-logo-large.pdf}}}

      \gdef\typesetjournal{\begin{fullwidth}  \journalfont% \textcolor{\fontblue}
            {\thejournalname} \end{fullwidth}}

      \newsavebox\titlebox
      \savebox\titlebox{%
               \parbox[t]{0.9\textwidth}{%
                  \begingroup
                        \raggedright
                        \hyphenpenalty 10000\exhyphenpenalty 10000 \raggedright \sloppy  \titlefont  {\textcolor{\fontblue}{\thetitle}}
                  \endgroup
              } %\parbox
      }

      \gdef\typesettitle{%
           \vspace*{4pt}
           %
           \vspace*{3.5pc}
           \firstpagemarginpar
           \vspace*{-3.5pc}
           %
           \usebox\titlebox
            \par
            \vspace*{6pt}
     }

      \gdef\typesetauthors{\authornormalfont\theauthors\par}
      %
      \gdef\typesetauthoraffiliations{\authorfootnotesandtablesfont\theauthoraffiliations}



      % Do the top of the first page.
       \begingroup
             \raggedright

            % Go to the paper top of the first page.
             \vspace*{-\headsepamount}  % back up geometry's headsep amount
             \vspace*{-\headheightamount}  % back up geometry's headheight amount
             \vspace*{-\topamount}  % back up geometry's top amount
             %
             \newlength{\firstpagetopamount}  \setlength{\firstpagetopamount}{24pt}
             \vspace*{\firstpagetopamount}
             %
           \typesetfirstpagelogo
           \vspace*{4pt}
           \typesetjournal
           \vspace*{2pt}
           \typesettitle  % Aso calls left margin par.
           \vspace*{-2pt}
           \typesetauthors
           \typesetauthoraffiliations
           \vspace*{-5pt}
       \endgroup
}% end \maketitle



%%   See Tufte code.  NOT WORKING
% \input{full-width-float} % Bring in code.

% Floats   % NOT WORKING
%
%\newenvironment{fullwidthfloat}
%    {
%        \begin{fullwidth}
%           \hspace*{\fullwidthmarginoverhang}
%           \begin{minipage}{\pagewidth}
%    }
%    %
%    {
%            \end{minipage}
%        \end{fullwidth}
%    }


% Watermark.
\RequirePackage[%
angle=270,
fontsize=14pt,
text=This\ paper\ has\ not\ been\ peer-reviewed,
hpos=0.98\paperwidth,
vpos=0.33\paperheight,
hanchor=r,
vanchor=t,
]{draftwatermark}



%
%  end Wiley
\endinput

%%xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx



\else  % Use old code.

\typeout{ELSE not published^^J}

%% From original AGU Class File by Amy Hendrickson
%%

%% SEARCH BELOW FOR THE NUMBER TO FIND PARTICULAR MACRO GROUP

    %% Macro Contents:
    %% 0) Usepackage graphicx, colorx, other .sty files which we'll need to have available.

    %% 1) Setting Default Dimensions

    %% 2) Global Parameters

    %% 3) Setting and Using Options

    %% 4) Font Family declarations

    %% 5) Running heads, Footnotes

    %% 6) Title Page: Journal Name,
    %%    Title, Authors, Affils, Corresponding Authors, Author Notes, Key Points; abstract

    %% 7) Section Commands

    %% 8) Figure and Table Captions

    %% 9) Listing

    %% 10) Etc.: Hyphenation Library, Quote, Extract

    %% 11) End Article: Appendix, Glossary, Acronyms, Notation, Acknowledgments

    %% 12) Bibliography, References

    %% 13) Track Changes

    %% 14) Supporting Information

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 0) Bringing in packages that we will need:

%% Nicer font choice than Computer Modern:
%\RequirePackage{newtxtext,newtxmath}

%% always will want this available
\RequirePackage{graphicx}

%% to get illustrations to print, in spite of being in Draft mode:
\setkeys{Gin}{draft=false}

%% xcolor.sty
\RequirePackage{xcolor}
\RequirePackage{url}

%% for better track changes
%\RequirePackage{trackchanges}

%% used for running head which is in light gray

\definecolor{ltgray}{cmyk}{.12,0,0,.3}

%% Line numbering
\RequirePackage{lineno}
%% add more space between text and number:
\advance\linenumbersep 12pt

%% this package makes paragraphs indent after section heads
\RequirePackage{indentfirst}


%% \RaggedRight makes the right margin go in and out; if this is commented out
%% the default will be a right justified margin.
\RequirePackage{ragged2e}
\RaggedRightParindent=24pt
\advance\RaggedRightRightskip 24pt
\RaggedRight

%% Defines \sidewaystable and \sidewaysfigure, preferred by AGU
\RequirePackage{rotating}
\newif\ifturnofflinenums
\let\savesidewaystable\sidewaystable
\let\savesidewaysfigure\sidewaysfigure
%% turns off line numbers in rotated tables and figures, aesthetic consideration,
%% not necessary.
\def\sidewaystable{\turnofflinenumstrue\savesidewaystable\centering}
\def\sidewaysfigure{\turnofflinenumstrue\savesidewaysfigure\centering}

%%xx Use apacite.  DC
%% Formats bibliography, this .sty file needs to be entered later
% \RequirePackage{natbib}

%\PassOptionsToPackage{normalem}{ulem}
%\RequirePackage{ulem}

%% <== End Bringing in Packages

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1) Setting Default Dimensions

  %% Comment
  %% parindent= indentation for every new paragraph
  %% parskip= distance between paragraphs. Giving `plus .1pt' allows
  %% a little stretch between paragraphs. If you don't like this stretch
  %% you can set \parskip=0pt

\parindent=24pt
\parskip=8pt % plus .1pt

  %% Comment
  %% \textheight is distance from bottom of text, exclusive of running
  %% foot, to top of text, exclusive of running head.

\textheight = 9.25in
  %% Comment
  %% \textwidth= Width of text in normal page. Can change this width locally
  %% with either \leftskip/\rightskip or change in \hsize, but will
  %% still be able to return to the normal width by setting \hsize=\textwidth
  %% Running head normally uses \textwidth as its width so that a change
  %% in \hsize in text will not change width of running head or feet.

\textwidth 5.5in

  %% Comment
  %% \voffset moves the printed page up or down on the physical page.
\advance\voffset-.25in

  %% Comment
  %% \hoffset moves the printed page left or right on the physical page.
\advance\hoffset.35in

  %% Comment
  %% Setting page dimensions
  %% See p. 84-- 85 in LaTeX Companion, Goosins, Mittlebach and Samarin
  %% or p. 555--556 in A Guide to LaTeX, Kopka and Daly, both Addison Wesley
  %% books.

  %% \topmargin space between top of page and running head

  %% \headheight height of running head

  %% \headsep  space between running head and text

  %% \topskip  space between top of text and baseline of first line
  %%            of text

  %% \footskip space between text and baseline of page number

  %% \columnsep space between two column text

  %% \columnseprule width of optional rule between columns, usually set to 0pt

  %%  \footnotesep Distance between two footnotes

  %%  \skip\footins Distance between text and footnote

  %%  \floatsep Distance between float and another
  %%       float for single col floats.

  %%  \textfloatsep Distance between float and text at top
  %%                     or bottom of page.

  %%  \intextsep  Distance between float and text if float is mid page
  %%                 or mid column

  %%  \dblfloatsep  For float spanning both columns in two column text,
  %%  above or below both columns, space between float and and float.


\topmargin0pt
\headheight 8pt
\headsep 6pt
\topskip  10pt
\footskip 36pt

\columnsep 10pt
\columnseprule 0pt

\footnotesep 6.65pt
\skip\footins 24pt plus .1pt minus .1pt

\floatsep 12pt plus 2pt minus 2pt
\textfloatsep 36pt plus 2pt minus 4pt
\intextsep 24pt plus 2pt minus 2pt

\dblfloatsep 12pt plus 2pt minus 2pt
\dbltextfloatsep 20pt plus 2pt minus 4pt

%% float placement, used by output routine
\@fptop 0pt plus 1fil
\@fpsep 8pt plus 2fil
\@fpbot 0pt plus 1fil
\@dblfptop 0pt plus 1fil
\@dblfpsep 8pt plus 2fil
\@dblfpbot 0pt plus 1fil

  %% When using \marginpar, how wide can marginal note be?

\marginparwidth .75in

  %% When using \marginpar, how much horizontal space between marginal
  %% note and text

  \setlength\marginparsep{40\p@}

  %% When to push marginal note on to next page, minimum vertical space between
  %% two marginal notes

\setlength\marginparpush{5\p@}

  %% space added before trivlist, which is used in many other
  %% macros, (for instance, verbatim environment)
  %% if macro is called in vertical mode, otherwise only parskip
  %% is added. Can set this without stretch if you don't like
  %% the stretchy space added.

\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}

  %% Comment
  %% Setting parameters that control float placement
  %%
  %% \topnumber counter holds the maximum number of
  %% floats that can appear on the top of a text page.
  %%
  %% \topfraction indicates the maximum part of a text page that can be
  %%     occupied by floats at the top.
  %%
  %% \bottomnumber counter holds the maximum number of
  %%     floats that can appear on the bottom of a text page.
  %%
  %% \bottomfraction indicates the maximum part of a text page that can be
  %%     occupied by floats at the bottom.
  %%
  %% \totalnumber indicates the maximum number of floats that can appear on
  %%     any text page.
  %%
  %% \textfraction indicates the minimum part of a text page that has to be
  %%     occupied by text.
  %%
  %% \floatpagefraction indicates the minimum part of a page that has to be
  %%     occupied by floating objects before a `float page' is produced.
  %%
  %% \dbltopnumber counter holds the maximum number of
  %%     two column floats that can appear on the top of a two column text
  %%     page.
  %%
  %% \dbltopfraction indicates the maximum part of a two column text page that
  %%     can be occupied by two column floats at the top.
  %%
  %% \dblfloatpagefraction indicates the minimum part of a page that has to be
  %%     occupied by two column wide floating objects before a `float
  %%     page' is produced.
  %%%

\setcounter{topnumber}{10}
\def\topfraction{.9}
\setcounter{bottomnumber}{10}
\def\bottomfraction{.1}
\setcounter{totalnumber}{10}
\def\textfraction{.2}
\def\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\def\dbltopfraction{.7}
\def\dblfloatpagefraction{.5}

  %% Setting Array and Table Spacing
  %% distance between columns in array
\setlength\arraycolsep{5\p@}

  %% distance between columns in tabular
\tabcolsep 6pt

  %% width of lines in array
\setlength\arrayrulewidth{.4\p@}

  %% horizontal space between two lines in array
\setlength\doublerulesep{2\p@}

  %% space between two lines in tabular
\setlength\tabbingsep{\labelsep}

  %% Minipage
  %% minipage space
\skip\@mpfootins = \skip\footins

  %% Framebox \fbox{} or \framebox{}
  %% space between line in framebox and text within it
\setlength\fboxsep{3\p@}

  %% width of ruled line in framebox
\setlength\fboxrule{.4\p@}


%%%%%%%%%%%%%%% <<== end dimensions

% 2) %%% Global parameters ==>>

  %% Makes sure that there will not be any widow or club lines,
  %% smaller numbers allow them occassionally, but you probably need
  %% these set to 10000 so that there are never any

\widowpenalty10000
\clubpenalty10000

  %% How many levels deep do you want sections to be numbered-- higher number
  %% means more levels will be numbered. Here was are asking only for
  %% sections to be numbered, not subsections, or subsubsection etc.
\setcounter{secnumdepth}{4}


  %% To make left and right page position differently, and have
  %% running heads be different on even and odd pages
\@twosidetrue

  %% Marginal notes should be on the left on even numbered pages; on
  %% right on odd numbered pages.
\@mparswitchtrue

  %% Starting with one column text
\@twocolumnfalse

  %% openbib will allow separate lines for parts of bibliography
  %% entries, default is to run different parts of bib entry into a
  %% paragraph form.

\newif\if@openbib
\@openbibfalse

  %% Conditionals that we can set and use later
\newif\if@openright
\newif\if@mainmatter
\newif\if@restonecol
\newif\if@titlepage
\newif\ifdraft
\newif\ifnumlines

  %% Comment
  %% Set Names, to be used later, usually in more than one
  %% macro.
\newcommand{\bibname}{Bibliography}
\newcommand{\figurename}{Figure}
\newcommand{\tablename}{Table}
\newcommand{\appendixname}{Appendix}

%%% <== end global parameters

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 3) Declare Options and Use Default Options
\DeclareOption{draft}{\global\drafttrue}
\DeclareOption{linenumbers}{\global\numlinestrue}
\DeclareOption{final}{\setlength\overfullrule{0pt}\global\draftfalse}

\ExecuteOptions{letterpaper,10pt,onecolumn,final,openright}
\ProcessOptions

\ifnumlines
\linenumbers*[1]
\fi

%% <==== End Setting Options

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4) Font Family Info

%% Comment
%% When \ifdraft is true it will make the baselineskip = \draftskip

\newcount\draftskip
\draftskip=20

\newcommand{\@ptsize}{}

  %% Comment
  %% Set font sizes, normal baselineskip, for the range of sizes,
  %% changing baselineskip to be larger if draft option is true
  %% \setfontsize takes the first arg as the size of the font and
  %% the second as the size of the baselineskip
  %% \abovedisplayskip and \belowdisplayskip is the space before and
  %% after an equation, adjusted in some sizes.

  %% \Huge 25pt
  %% \huge 20pt
  %% \LARGE 17pt
  %% \Large 14pt
  %% \large 12pt
  %% \normalsize 10 pt font
  %% \small 9pt
  %% \footnotesize 8pt
  %% \scriptsize 7pt font
  %% \tiny 5pt font


\renewcommand\normalsize{%
\ifdraft
   \@setfontsize\normalsize\@xpt{\draftskip}
\else
   \@setfontsize\normalsize\@xpt{12}
\fi
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize

\newcommand\bignormalsize{\@setfontsize\bignormalsize{10.5pt}{12}}

\newcommand\small{%
\ifdraft
   \@setfontsize\small\@ixpt{\draftskip}%
\else
   \@setfontsize\small\@ixpt{14}%
\fi
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}

\newcommand\footnotesize{%
\ifdraft
   \@setfontsize\footnotesize\@viiipt{\draftskip}%
\else
   \@setfontsize\footnotesize\@viiipt{12}%
\fi
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}

\newcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\newcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\newcommand\large{\ifdraft
\@setfontsize\large\@xiipt{\draftskip}
\else
\@setfontsize\large\@xiipt{14}
\fi
}

\newcommand\Large{\ifdraft
\@setfontsize\Large\@xivpt{\draftskip}
\else
\@setfontsize\Large\@xivpt{18}
\fi}

\newcommand\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\newcommand\huge{\@setfontsize\huge\@xxpt{25}}
\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}

%%%%%%%%%%%%%%%%%%%%%%%%%%

%% These definitions accomodate older font typeface commands,
%% that are still in use.

\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand{\cal}{\@fontswitch{\relax}{\mathcal}}
\DeclareRobustCommand{\mit}{\@fontswitch{\relax}{\mathnormal}}

%% end font family declarations
%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 5) Running heads and footnotes

%% Running heads ===>>>

  %% unless we need these, leave these uncommented
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
  %%

\def\ps@headings{\def\@oddfoot{\centerline{\small --\the\c@page--}}
\let\@evenfoot\@oddfoot
%% \thejournalname set with \journalname{} command; if not you will get a request to set
%% the journal name with \journalname{}
\def\@oddhead{\vbox to 0pt{\vss\centerline{\color{ltgray}\small manuscript
submitted to {\it \thejournalname}}\vspace24pt}}
\let\@evenhead\@oddhead
}



%% After ps@headings is defined, now we use it to activate the definitions
\ps@headings

%%% Footnotes

  %% save these definitions so that we can use them if
  %% we don't like the redefinition
\let\savefootnote\footnote
\let\savefootnotetext\footnotetext

  %%% ruled line above footnote

  \renewcommand{\footnoterule}{%
  \kern-3\p@
  \hrule width .4\columnwidth
  \kern 2.6\p@}

 \let\savefootnoterule\footnoterule

% turn off footnote rule, line at bottom of page above footnotes
  \let\footnoterule\relax

% can turn it back on by uncommenting
\let\footnoterule\savefootnoterule

% Making footnote indent 1em
\long\def\@makefntext#1{%
\noindent\hspace*{1em}\@makefnmark\,#1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 6) Title Page:
   %% Journal Name, running heads;
   %% Title, Authors, Affils, Corresponding Authors, Author Notes, Key Points;
   %% Starting article with abstract.

%% Set journal name:
\def\journalname#1{\def\thejournalname{#1}}
\journalname{Please set Journal Name by using {\tt\string\journalname}}


%% Article Title
\def\title#1{\global\c@footnote=0\relax%
{\centering \Large\bf #1 \vspace14pt}
\def\thetitle{#1}}

\def\authors#1{{\centering \normalsize\bf #1\vspace12pt}}
\def\affil#1{$^{#1}$\ignorespaces}
\def\affiliation#1#2{\vspace-.5\parskip\relax{\centering{\footnotesize
$^{#1}$#2\relax}\vspace-\parskip}}

\def\correspondingauthor#1#2{{\let\@thefnmark\relax\@footnotetext{\noindent\vrule
height 18pt width0pt\relax\hbox to-8pt{}{\small
Corresponding author: #1,
{\tt #2}}}}}

%% Used to send footnote to bottom of page when entered in \authors{} field.
\def\thanks#1{{\renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\noindent\hskip-9pt\hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}\footnote{#1}\
		}}

\def\keypoints{\vspace24pt\vspace1sp\subsection*{Key Points:}
\vspace*{-\marginparentrysep}
\begin{itemize}[itemsep=1pt]%[noitemsep]
}
\def\endkeypoints{\end{itemize}}

\def\abstract{\newpage\noindent{\bf Abstract}\vspace-\parskip
\global\c@footnote=0\relax%
\noindent\ignorespaces}
\def\endabstract{\vspace18pt}

%% <== End Title page and Abstract

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 7) Section Commands

%  SectionCounters, Header Level Counters ===>>

  %% the argument in square brackets is for the command that will reset
  %% counter to zero
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]


  %% Header Level Counters ==>>
  %% Change to any level will change the levels below


\renewcommand{\thesection}      {\arabic{section}}
\renewcommand{\thesubsection}   {\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}
\renewcommand{\theparagraph}    {\thesubsubsection.\arabic{paragraph}}
\renewcommand{\thesubparagraph} {\theparagraph.\arabic{subparagraph}}

\newcommand{\@chapapp}{\chaptername}

  %%% <<== End Header Level Counters

  %% Definition printed here so that you can see what the various arguments are
  %% when used for \section, \subsection, etc, below
  %% \newcommand{\section}{\@startsection {section}{1}{\z@}...}


% \@startsection {NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}
%            optional * [ALTHEADING]{HEADING}
%    Generic command to start a section.
%    NAME       : e.g., 'subsection'
%    LEVEL      : a number, denoting depth of section -- e.g., chapter=1,
%                 section = 2, etc.
%    INDENT     : Indentation of heading from left margin
%    BEFORESKIP : Absolute value = skip to leave above the heading.
%                 If negative, then paragraph indent of text following
%                 heading is suppressed.
%    AFTERSKIP  : if positive, then skip to leave below heading, else
%                 negative of skip to leave to right of run-in heading.
%    STYLE      : commands to set style
%  If '*' missing, then increments the counter.  If it is present, then
%  there should be no [ALTHEADING] argument.
%  Uses the counter 'secnumdepth' whose value is the highest section
%  level that is to be numbered.

  %% Startsection calls \@sect, the engine that formats each section

  %% the minus dimensions are used to tell LaTeX not to indent
  %% the text following the section head
  %% (silly, isn't it? but built into LaTeX)
  %% You can add things like underline or uppercase to the last arg
  %% to get those effects in a section head

%% adds a little space after the section number, before following text.
\def\@seccntformat#1{\csname the#1\endcsname\ \ }

\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {\ifdraft18pt plus 1pt minus
				   1pt\else 12pt plus 1pt minus 1pt\fi}%
                                   {1sp}%
                                   {\bignormalsize\bfseries\boldmath}}

\newcommand\subsection{\@startsection{subsection}{2}{\parindent}%
                                   {\ifdraft 12pt\else 8pt\fi}%
                                   {1sp}%
                                   {\normalfont\bf\boldmath}}

\newcommand\subsubsection{\@startsection{subsubsection}{3}{\parindent}%
                                   {\ifdraft 12pt\else 8pt\fi}%
                                   {1sp}%
                                   {\normalfont\itshape\bfseries}}

\newcommand\paragraph{\@startsection{paragraph}{4}{\parindent}%
                                    {3pt plus 1pt minus 1pt}%
                                    {-1em}%
                                    {\normalfont\normalsize\itshape}}

\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                    {3pt plus 1pt minus 1pt}%
                                    {-1em}%
                                      {\normalfont\normalsize\itshape}}

  %%% <<=== end section commands


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 8) Figure and Table Captions ==>>>

\long\def\@caption#1[#2]#3{%
  \par
  \begingroup
    \@parboxrestore
    \normalsize
\linenumbers
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup}
\def\@float#1{%
  \@ifnextchar[%
    {\@xfloat{#1}}%
    {\edef\reserved@a{\noexpand\@xfloat{#1}[\csname fps@#1\endcsname]}%
     \reserved@a}}
\def\@dblfloat{%
  \if@twocolumn\let\reserved@a\@dbflt\else\let\reserved@a\@float\fi
  \reserved@a}

  %%  Name of Figure or Table is set with \figurename or \tablename above
  %% \@float is what puts the text at the top or bottom of the page
  %% \@dblfloat is for floats in two column text

\newcounter{figure}
\renewcommand{\thefigure}{\arabic{figure}}

\def\fps@figure{tbp} % position figure at top, bottom, or on its own page
\def\ftype@figure{1} % used for placing float in page
\def\ext@figure{lof} % send info to .lof file
\def\fnum@figure{\figurename~~\thefigure} % \figurename, defined above,
                              %% and the current state of figure counter

  %% \begin{figure} calls up float and gives it the {figure} argument,
  %% which is then used to call up the definitions above, by using
  %% \csname fps@\captype\endcsname, for instance, to get \fps@figure;
  %% adjusting the macro to do different things depending on whether
  %% figure, table, environment, or other term is used.

\newenvironment{figure}
               {\@float{figure}}
               {\end@float}

  %% figure in two column text
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}

  %% Similar as the sequence of definitions above used for figure
\newcounter{table}
\renewcommand{\thetable}{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}

  %%%%%%%%%%%%%%%%
  %% Setting space between caption in table or figure and the
  %% table or figure
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{10\p@}

  %% to test in caption to see whether it is a figure or table
\def\xfigure{figure}

  %% Variation on LaTeX code
  %% Skips below caption
  %% an extra 3pt if it is a table to give extra space between caption
  %% and table, since caption for table goes above table.

  %% \sbox\@tempboxa sets a temporary box so that we can measure
  %% the width of the caption; if width is greater than .9\hsize
  %% then make it format in a paragraph, otherwise center it.

  %% Test to see if it a figure or table: \ifx\@captype\xfigure
  %% If figure, \vspace\belowcaptionskip

\long\def\@makecaption#1#2{%
{\small
\ifx\@captype\xfigure
\vspace\abovecaptionskip\fi
{\ifturnofflinenums\else\ifnumlines\internallinenumbers\fi\fi
 \sbox\@tempboxa{\bf#1.\quad \rm #2}%
  \ifdim \wd\@tempboxa >.9\hsize
\bf #1.\quad\rm\relax #2\par
  \else
{\centering
 \bf #1.\rm\quad #2
\vspace1sp}
  \fi}
%%
\ifx\@captype\xfigure\else
  \vspace\belowcaptionskip\fi
}}


  %% Code to get text in tables to extend all the way to left and right
  %% of table. The LaTeX table macros are made to allow space to the
  %% left and the right of tables to accomodate vertical ruled lines. But
  %% most publishers don't want vertical ruled lines.  If the authors
  %% don't use the ruled lines there would be extra white space without
  %% the changes below. This code is very complicated, but you can see
  %% the changed part.

\def\xtable{table}
\def\@array[#1]#2{\setbox\@arstrutbox=\hbox{\vrule
     height\arraystretch \ht\strutbox
     depth\arraystretch \dp\strutbox
     width\z@}\@mkpream{#2}\edef\@preamble{\halign \noexpand\@halignto
\bgroup%
\tabskip\z@\@arstrut\@preamble
\ifx\@captype\xtable\hskip-\tabcolsep\fi  %% <==== Changed
\tabskip\z@ \cr}%
\let\@startpbox\@@startpbox \let\@endpbox\@@endpbox%
  \if #1t\vtop \else \if#1b\vbox \else \vcenter \fi\fi%
  \bgroup\let\par\relax%
  \let\@sharp##\let\protect\relax \lineskip\z@\baselineskip\z@\@preamble}


  %% Variation on code found in Latex.tex
\def\new@tabacol{\edef\@preamble{\@preamble\hskip0pt}}

\def\@tabclassz{\ifcase \@lastchclass\@acolampacol%
\or \@ampacol \or
   \or \or \@addamp \or \@acolampacol\or \@firstampfalse
\ifx\@captype\xtable \new@tabacol\else\@tabacol \fi%
\fi%
\edef\@preamble{\@preamble%
  \ifcase \@chnum%
     \hfil\ignorespaces\@sharp\unskip\hfil%
     \or \ignorespaces\@sharp\unskip\hfil%
     \or \hfil\hskip\z@ \ignorespaces\@sharp\unskip\fi}}

  %% This puts extra space between horizontal lines in tables.
  %% If you want to use vertical lines in tables, you should use
  %% \savehline rather than \hline, otherwise the vertical and
  %% horizontal lines will not abutt.

  %% \noalign is a command that allows the uses to put something
  %% between lines in a table.
\let\savehline\hline
\def\hline{\noalign{\vspace3pt}\savehline\noalign{\vspace3pt}}

  %% Simple macro for table notes, that makes sure that there is
  %% a little space between the table and the notes, and that they
  %% print in footnotesize.
\def\tablenotes{\vspace2pt\footnotesize}
\let\endtablenotes\relax

  %%% <<=== end Figure and Table Captions


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 9) Listing, ==>>
\def\@listI{\leftmargin\leftmargini
            \parsep 0\p@ %\@plus2\p@ \@minus0\p@
            \topsep 4\p@ %\@plus2\p@ \@minus0\p@
            \itemsep1\p@ %\@plus2\p@ \@minus0\p@
}
\let\@listi\@listI
\@listi

\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    4\p@ \@plus2\p@ \@minus\p@
              \parsep    2\p@ \@plus\p@  \@minus\p@
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    2\p@ \@plus\p@\@minus\p@
              \parsep    \z@
              \partopsep \p@ \@plus\z@ \@minus\p@
              \itemsep   \topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}

  %% amount left edge of text is indented relative to normal text
  %% i is for first level in, ii is for second level in, etc.
\setlength\leftmargini  {28pt}
\setlength\leftmarginii  {11pt}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\setlength\leftmarginv  {1em}
\setlength\leftmarginvi {1em}


  %% default indentation for first level itemized lists
\setlength\leftmargin    {\leftmargini}

  %% horizontal distance between item and following text
\setlength  \labelsep  {6pt}

  %% how wide should item be?
\setlength  \labelwidth{\leftmargini}

  %% subtract width of label separation
\addtolength\labelwidth{-\labelsep}

  %% more listing defaults
\leftmargin\leftmargini
\labelwidth\leftmargini\advance\labelwidth-\labelsep


\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty

  %% defining listing markers for enumerate
\renewcommand{\theenumi}{\arabic{enumi}}
\renewcommand{\theenumii}{\alph{enumii}}
\renewcommand{\theenumiii}{\roman{enumiii}}
\renewcommand{\theenumiv}{\Alph{enumiv}}

  %% using listing markers for enumerate
\newcommand{\labelenumi}{\theenumi.\hskip-2pt}
\newcommand{\labelenumii}{(\theenumii)}
\newcommand{\labelenumiii}{\theenumiii.}
\newcommand{\labelenumiv}{\theenumiv.}

  %% crossreferencing for listing markers
\renewcommand{\p@enumii}{\theenumi}
\renewcommand{\p@enumiii}{\theenumi(\theenumii)}
\renewcommand{\p@enumiv}{\p@enumiii\theenumiii}

  %% listing markers for itemize (no crossreferencing needed)
\newcommand{\labelitemi}{\raise.4ex\hbox{\tiny$\bullet$}}
\newcommand{\labelitemii}{\normalfont\bfseries --}
\newcommand{\labelitemiii}{$\m@th\ast$}
\newcommand{\labelitemiv}{$\m@th\cdot$}

  %% Setting up description listing environment
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}

\newcommand*{\descriptionlabel}[1]{\hspace\labelsep
                                \normalfont\bfseries #1}

%%% <<=== end of listing commands

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 10) ETC.: Month/year, Hyphenation Library, Quote, Quotation, Extract

%% Month and Year

% Nice example of \ifcase which takes a counter and activates
% the slot following the counter that matches the same number;
% \month expands to a number, so ifcase will activate the slot
% matching that number. Can use it for setting date in draft
% footnote if desired. Not activated at this time.

\newcommand{\today}{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}

%  Hyphenation Library
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Hyphenation Library, add to this
%% list if desired

\hyphenation{
dem-o-graph-ics
mi-cro-ec-o-nom-ic
or-gan-i-za-tion
or-gan-i-za-tions
ra-tion-ale
sys-tem-at-i-cal-ly
}


%%%% Quote, Quotation, Extract
  %% \newenvironment produces a \begin{}..\end{} macro set.
  %% \newenvironment{<name of macro>}{<definition for begin macro>}
  %% {<definition for end macro>}

  %% For long quotation which runs more than one paragraph,
  %% uses list environment to indent text, supplies dummy
  %% item, \item[], since one item is required for every listing
  %% environment or you will get an error message.

  %% quotation indents new paragraphs, while quote does not.

\newenvironment{quotation}
               {\small
\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item[]}
               {\endlist}
\newenvironment{quote}
               {\small
\list{}{\rightmargin\leftmargin}%
                \item[]}
               {\endlist}

  %% If \begin{extract}...\end{extract} is used you will get the same
  %% results as \begin{quotation}...\end{quotation}

\let\extract\quotation
\let\endextract\endquotation

  %% <<== end ETC.: Month/year, Hyphenation Library, Quote, Quotation, Extract

%%%%%%%%%
% 11) End Article: Appendix, Glossary, Acronyms, Notation, Acknowledgments

% Appendix:
\newcounter{appendnum}

\newif\ifappendon
\newif\ifupperappend

\def\appendix{%
\def\@currentlabel{\Alph{section}:} %xx Doesn't do much.  Missing trailing space.  DC
\@addtoreset{equation}{section}
\@addtoreset{table}{section}
\@addtoreset{figure}{section}
%%
\renewcommand{\thesection}{Appendix \Alph{section}} %xx Redefined below (by orginal author, not DC).    DC
\renewcommand{\theequation}{\Alph{section}\arabic{equation}}
\renewcommand{\thefigure}{\Alph{section}\arabic{figure}}
\renewcommand{\thetable}{\Alph{section}\arabic{table}}
\global\appendontrue\goodbreak
\global\c@section=0
\global\c@equation=0
\def\thesection{Appendix \Alph{section}} %xx What puts the : in \ref.   Taken out now.  DC
\def\thesubsection{\Alph{section}\@arabic{\c@subsection}}
\def\thesubsubsection{\thesubsection\@arabic{\c@subsubsection}}
\def\thesubsubsubsection{\thesubsubsection\@arabic{\c@subsubsection}}
}
%%%%% end appendix

%%  Glossary
\def\glossary{\bgroup
\section*{Glossary}
\description
\def\term##1{\item[##1]}}
\def\endglossary{\enddescription\vspace12pt\egroup}
%%

%% Acronyms
\def\acronyms{\bgroup
\section*{Acronyms}
\description
\def\acro##1{\item[##1]}}
\def\endacronyms{\enddescription\vspace12pt\egroup}

%% Notation
\def\notation{\bgroup
\section*{Notation}
\description
\def\notation##1{\item[\boldmath ##1]}}
\def\endnotation{\enddescription\vspace12pt\egroup}

%% Acknowledgments
\def\acknowledgments{\vspace12pt\noindent{\bf
Acknowledgments\vrule depth 6pt
width0pt\relax}\\*\noindent\ignorespaces}

%%% <<=== end  Appendix, Glossary, Acronyms, Notation, Acknowledgments


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 12) %% Bibliography, References ===>>

%% Set bibliography style: This brings in agufull08.bst to format
%% bibliography when using BibTeX.
%\bibliographystyle{agufull08}
%
\bibliographystyle{apacite}

%% In case you want to enter bib entries without using bibtex
\def\references{\thebibliography{}\item[]}
\let\endreferences\endthebibliography

\def\@cite#1#2{{#1\if@tempswa , #2\fi}}

\def\@citex[#1]#2{%
  \let\@citea\@empty
  \@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{,\penalty\@m\ }%
     \edef\@citeb{\expandafter\@firstofone\@citeb}%
     \if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi
     \@ifundefined{b@\@citeb}{\mbox{\reset@font\bfseries ?}%
       \G@refundefinedtrue
       \@latex@warning
         {Citation `\@citeb' on page \thepage \space undefined}}%
  %%
  %% This is changed from the default so that lengthy citations can
  %% be broken across lines
       {%\hbox{
\csname b@\@citeb\endcsname%}
}}}{#1}}

\newdimen\bibindent
\setlength\bibindent{1.5em}

\def\refname{References}
\newenvironment{thebibliography}[1]
     {\section*{\refname
        \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

\def\newblock{\hskip .11em\@plus.33em\@minus.07em}




% Formats bibliography, this .sty file needs to be entered here

 %
% When using NatBib, this sets brackets for citations:
%\renewcommand\NAT@open{(} \renewcommand\NAT@close{)}   %xx Parens by default, but not using anyways.  DC

\RequirePackage{apacite}
%\RequirePackage{natbib}
\let\cite\shortcite %xx So get et al. with three authors the first time.
%\let\citep\shortcite %xx A natbib command.
%\let\citet\shortcite %xx Ditto.
\let\citeA\shortciteA %xx Ditto.



%% end Bibliography, and References

%%%%%%%%%%%%%%%%%%%%%%%%%%xx Removed.  DC

%%% Track Changes
%%% Amy Hendrickson, Feb 2016
%
%\providecolor{trackcolor}{rgb}{1,0,0}
%\providecolor{explain}{rgb}{.5,0,.5}
%
%\newcount\refchangenumber
%
%\def\added{\@ifnextchar[{\xadded}{\yadded}}
%
%\long\def\xadded[#1]#2{%
%\ifdraft{\global\advance\refchangenumber by 1\relax%
%\ifnumlines
%\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
%\xdef\doit{\noexpand\label{\the\refchangenumber}{}{}{}}\doit\fi%
%\color{trackcolor}(Added: #2)}%%
%\expandafter\gdef\csname
%changenum\the\refchangenumber\endcsname{Added: [#1]
%\textcolor{trackcolor}{#2}, }\else#2\fi}
%
%\long\def\yadded#1{%
%\ifdraft{\global\advance\refchangenumber by 1\relax%
%\ifnumlines
%\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
%\xdef\doit{\noexpand\label{\the\refchangenumber}{}{}{}}\doit\fi%
%\color{trackcolor}(Added: #1)}%%
%\expandafter\gdef\csname changenum\the\refchangenumber\endcsname{Added:
%\textcolor{trackcolor}{#1}, }\else#1\fi}
%
%\def\deleted{\@ifnextchar[{\xdeleted}{\ydeleted}}
%
%\long\def\xdeleted[#1]#2{%
%\ifdraft{\global\advance\refchangenumber by 1\relax%
%\ifnumlines
%\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
%\xdef\doit{\noexpand\label{\the\refchangenumber}{}{}{}}\doit\fi%
%\color{trackcolor}(Deleted: \sout{#2})}%%
%\expandafter\gdef\csname
%changenum\the\refchangenumber\endcsname{Deleted: [#1]
%\textcolor{trackcolor}{#2}, }\else#2\fi}
%
%\long\def\ydeleted#1{
%\ifdraft
%\global\advance\refchangenumber by 1
%\ifnumlines\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
%\xdef\doit{\noexpand\label{\the\refchangenumber}}\doit\fi%
%{\color{trackcolor}(Deleted: \sout{#1})}%
%\expandafter\def\csname changenum\the\refchangenumber\endcsname{Deleted:
%{\color{trackcolor}\sout{#1}}, }\fi}
%
%\def\replaced{\@ifnextchar[{\xreplaced}{\yreplaced}}
%
%\long\def\xreplaced[#1]#2#3{%
%\ifdraft
%\global\advance\refchangenumber by 1
%\ifnumlines\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
%\xdef\doit{\noexpand\label{\the\refchangenumber}}\doit\fi%
%{\color{trackcolor}(Replaced: \sout{#2}}
%{\color{black}replaced with:} {\color{trackcolor} #3)}%
%\expandafter\gdef\csname
%changenum\the\refchangenumber\endcsname{Replaced: [#1]
%{\color{trackcolor}\sout{#2}} {\color{black} replaced with:}
%{\color{trackcolor}#3}, }\else#3\fi}
%
%\long\def\yreplaced#1#2{%
%\ifdraft
%\global\advance\refchangenumber by 1
%\ifnumlines\xdef\doit{\noexpand\linelabel{\the\refchangenumber}}\doit\else%
%\xdef\doit{\noexpand\label{\the\refchangenumber}}\doit\fi%
%{\color{trackcolor}(Replaced: \sout{#1}}
%{\color{black}replaced with:} {\color{trackcolor} #2)}%
%\expandafter\gdef\csname changenum\the\refchangenumber\endcsname{Replaced:
%{\color{trackcolor}\sout{#1}} {\color{black} replaced with:}
%{\color{trackcolor}#2}, }\else#2\fi}
%
%\global\@mparswitchfalse
%\def\explain{\@ifnextchar[{\xexplain}{\yexplain}}
%
%%%
%\def\xexplain[#1]#2{\ifdraft\marginpar{\noindent{\color{red}\llap{\boldmath$\leftarrow$}\draftfalse\normalsize
%\baselineskip=11pt\relax[#1] #2\vspace1sp}}\fi}
%
%\def\yexplain#1{\ifdraft\marginpar{\noindent{\color{red}\llap{\boldmath$\leftarrow$}\draftfalse\normalsize
%\baselineskip=11pt\relax#1\vspace1sp}}\fi}
%
%
%\newcount\listchangenum
%
%\def\listofchanges{
%\clearpage
%\ifdraft
%\ifnum\refchangenumber>0
%\ifnumlines\nolinenumbers\fi
%\vspace36pt
%\vtop{\hrule
%\noindent{\vrule height 9pt width0pt depth 6pt\large\bf List of Changes}
%\hrule
%\vspace18pt}
%\nobreak
%{\parskip=4pt \parindent-18pt \leftskip=18pt
%\loop
%\vspace-1pt\relax
%\global\advance\listchangenum by 1\relax
%\expandafter\ifx\csname changenum\the\listchangenum\endcsname\relax
%\else
%\csname changenum\the\listchangenum\endcsname\ on page
%\pageref{\the\listchangenum}%
%\ifnumlines
%\setbox0=\hbox{\lineref{\the\listchangenum}}%
%\ifdim\wd0>20pt%
%\else%
%, line\
%\lineref{\the\listchangenum}%
%\fi\fi.
%\repeat}
%\fi\fi
%\thispagestyle{empty}
%}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 14) Supporting Information
\def\supportinginfo#1{\newpage
{\large\bf\noindent Supporting  Information for\vspace-6pt\noindent``#1''}
\vspace12pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Start page numbering, formatting

\pagenumbering{arabic}
\widowpenalty=10000
\clubpenalty=10000
\ifdraft
\RaggedRight
\fi


\endinput


\fi  % End non-published style  DC
