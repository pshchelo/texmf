%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                          %
%                   IRPHELetter.cls                                        %
%                                                                          %
%      This class document is intended to provide a standard environment   %
%      for writing letter with a standard IRPHE letterhead                 %
%      it was inspired by the example in                                   %
%      Appendix A.3 of "A guide to LaTeX" by Kopka & Daly                  %
%      Addison-Wesley IBSN 0-201-39825-7                                   %
%                                                                          %
%    Please consult me before attemping to modify this file                %
%    V1.0                                                                  %
%                     Geoff SEARBY    June 1999                            %
%                                                                          %
%    v1.1                                                                  %
%    Mise ˆ Jour pour IRPHE Chateau-Gombert en fevrier et juillet 2001     %                                                                   %                                                                          %
%    v1.2   November 2002                                                  %
%    Modified to use Babel instead of French package                       %
%                                                                          %
%    v1.3   October 2003                                                   %
%    Modified to be compatible with pdfLaTeX                               %
%                                                                          %
%    v2.0   January 2005                                                   %
%    Modified to use new IRPHE Logo and layout                             %
%                                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{IRPHELetter}
\RequirePackage{ifthen}       %For choice of English or French 
\newboolean{@cmrstyle}
\setboolean{@cmrstyle}{false}
\DeclareOption{cmr}{\setboolean{@cmrstyle}{true}}
\DeclareOption{ssf}{\setboolean{@cmrstyle}{false}}
\newboolean{@frenchstyle}
\setboolean{@frenchstyle}{true}
\DeclareOption{english}{\setboolean{@frenchstyle}{false}}
\DeclareOption{french} {\setboolean{@frenchstyle}{true}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}
\ProcessOptions
\LoadClass[a4paper]{letter}
%
    \typeout{^^JIRPHELetter class, G.SEARBY v2.0 Janvier 2005}
% 
%  Default character set is sans serif.
%  cmr option is allowed and over-rides the default ssf option
%
\ifthenelse{\boolean{@cmrstyle}}
    {\typeout{Using cmr fonts} }%
%
% CMR font not specifically requested
%
  {\typeout{Using cmss fonts} \renewcommand{\rmdefault}{cmss}}
%

%
%  Allow French or English  style as requested
%  Load babel package if available
%  Default is french style
%
  \ifthenelse{\boolean{@frenchstyle}}
	{\typeout{Option French style.} 
  \IfFileExists{babel.sty}
	  {\typeout{Le package Babel a ete trouve et installe.^^J}
	   }
	{\typeout{^^JLe package Babel N'A PAS ete trouve}
	   \typeout{Vous devez l'installer !^^J}}
	   \RequirePackage{babel}} 
     {\typeout{Option English style.^^J}
	\IfFileExists{babel.sty}
	  {\typeout{Le package Babel a ete trouve et installe.^^J}
	   \RequirePackage{babel}}{}}
%
% We load babel package if it exists, since if babel has been 
% loaded once for a document it will always be required
% until the .aux file is trashed !
%
%
% Compatibility LaTeX & PDFLaTeX compilations To display CNRS Logo
%
\ifx\pdfoutput\undefined
% we are running LaTeX, not pdflatex
\RequirePackage{graphicx}
\else
% we are running pdflatex, so convert .eps files to .pdf
\RequirePackage[pdftex]{graphicx}
\RequirePackage{epstopdf}
\fi
%
%                                       % Define font size for 
\newcommand{\ads}{\footnotesize}        % sender's address
%
\newcommand{\englishnames}{
\newcommand{\netname}{\ads{\textsl{E-mail}}}
\newcommand{\yrefname}    {\textsl{Your Ref.}}
\newcommand{\ymailname}   {\textsl{Your letter of}}
\newcommand{\myrefname}   {\textsl{Our Ref.}}
\newcommand{\objetname}   {\textsl{{Subject}}}
\newcommand{\@Marseille}  {}
 }
%
\newcommand{\frenchnames} {
\newcommand{\netname}{\ads{\textsl{M\'{e}l~}}}
\newcommand{\yrefname}    {\textsl{Votre Ref.~}}
\newcommand{\ymailname}   {\textsl{Votre courrier du~}}
\newcommand{\myrefname}   {\textsl{Notre Ref.~}}
\newcommand{\objetname}   {\textsl{{Objet~}}}
\newcommand{\@Marseille}  {Marseille, le~}
 }
%
\ifthenelse{\boolean{@frenchstyle}}
  {\frenchnames} {\englishnames}
\ifthenelse{\boolean{@frenchstyle}}
% Use Babel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
{\selectlanguage{french}} {\selectlanguage{english}}
%
% Set up storage variables for new commands
%
\newcommand{\@myposition}{}
\newcommand{\@mytitle}{}
\newcommand{\@yref}{}
\newcommand{\@myref}{}
\newcommand{\@ymail}{}
\newcommand{\@objet}{}
\newcommand{\@tel}{}
\newcommand{\@fax}{}
\newcommand{\@email}{}
%
\newcommand{\myposition}[1]{\renewcommand{\@myposition}{#1}}
\newcommand{\mytitle}   [1]{\renewcommand{\@mytitle}{#1}}
\newcommand{\yref}      [1]{\renewcommand{\@yref}{\yrefname: #1}}
\newcommand{\myref}     [1]{\renewcommand{\@myref}{\myrefname: #1}}
\newcommand{\ymail}     [1]{\renewcommand{\@ymail}{\ymailname: #1}}
\newcommand{\objet}     [1]{\renewcommand{\@objet}{\objetname: #1}}
\newcommand{\tel}       [1]{\renewcommand{\@tel}{\ads{Tel.\,: #1}}}
\newcommand{\fax}       [1]{\renewcommand{\@fax}{\ads{Fax.: #1}}}
\newcommand{\email}     [1]{\renewcommand{\@email}{\ads{\netname:~\textsl{#1}}}}
%
%  Set up page size, margins and text 
%
\setlength{\textwidth}{\paperwidth}
\addtolength{\textwidth}{-60mm}         % \textwidth -> 150mm for A4
%
\setlength{\textheight}{\paperheight}
\addtolength{\textheight}{-100mm}       % \textheight -> 197mm for A4
%\addtolength{\textheight}{-102mm}       % \textheight -> 200mm for A4
%
\setlength{\oddsidemargin} {4.6mm}      % Actual margin will be 30 mm
\setlength{\evensidemargin}{4.6mm}      % Actual margin will be 30 mm
%
\setlength{\topmargin}  {10mm}      % Actual margin will be 35,4 mm
\setlength{\footskip}   {0mm}
%
%
%  This is where all the hard work is done
%  The page background with IRPHE logo at top left
%  and partners logos at page foot are all put into the header box
%
%  The sender and recipient information is put into the footer box
%  It is not possible to superimpose the header information and
%  the background if they are both put into the header box
%
% Note that the footer is printed last, so if the page background is
% put in the footer, it will print ON TOP of the text of the letter
%
\newsavebox{\IRPHELogo}
%\savebox{\IRPHELogo}{\fbox{\includegraphics{IRPHELogo}}}  % Draw box for debugging
\savebox{\IRPHELogo}{\includegraphics{IRPHELogo}}
%
%  Redefine "firstpage" command of letter environment
% The image is "raised" by -241mm and shifted "right" by -29.5 mm
%
\renewcommand{\ps@firstpage}%
{\renewcommand{\@oddhead}{%
  \hspace{-29.5mm}\raisebox{-241mm}[20mm][00mm]{\usebox{\IRPHELogo}}}%
  \renewcommand{\@oddfoot}{%                   % Increase number in vspace to move text up
  \parbox[t][50mm][t]{\textwidth}{\vspace*{-230mm} % Parbox   1 contains both adresses
%  \framebox[71mm][l]{                         % Framebox 2 for debugging
    \parbox[t][48mm][t]{70 mm}{                % Parbox   2 box contains sender's address
    \vspace{16.5mm}                              % Vertical tuning of sender name & data 
    \ads{\textsl{\textbf{\fromname}}} \\
    \ifthenelse{\equal{\@myposition}{}}
              {}{\ads{\@myposition}\\ }
%              \ads{49, rue Fr\'{e}d\'{e}ric Joliot-Curie}\\
%              \ads{Technopôle de Ch\^{a}teau-Gombert}\\
%              \ads{BP 146 - F-13384 Marseille Cedex 13}\\
%              \ads{\textsl{www.irphe.univ-mrs.fr}}\\
    \ifthenelse{\equal{\@tel}{}}
              {}{\@tel \\ }
    \ifthenelse{\equal{\@fax}{}}
              {}{\@fax \\ }
    \ifthenelse{\equal{\@email}{}}
              {}{\@email}
   }                                          % End of parbox 2 sender's address
% }                                           % End of framebox 2
%
  \hfill 
%
% \framebox[71mm][l]{                           % Framebox 3 for debugging
   \parbox[t][50mm][t]{6.9cm}{                 % Parbox   3 contains the date and the recipient's address
     \makebox[68mm][r]{\@Marseille \@date} \\[14mm] % Today's date right justified
     \toname     \\                             % Recipient's name
     \toaddress  \\                             % Recipients address
    }                                           % End of parbox   3 recipient's address
%  }                                            % End of framebox 3
  }                                             % End of parbox   1
}%                                            % End of @oddfoot
  \renewcommand{\@evenhead}{}%
  \renewcommand{\@evenfoot}{}}
%
%  Redefine ordinary headings command of letter environment
%
\input{IRPHE_foot}
%
\renewcommand{\ps@headings}
%  {\renewcommand{\@oddhead}{\raisebox{21mm}[0pt]{\usebox{\IRPHE}}\\}%
%   \renewcommand{\@oddfoot}{\raisebox{-10mm}{\usebox{\irphefoot}}\\}%
  {\setlength{\headheight}{20mm} \setlength{\headsep}{10mm}%
   \renewcommand{\@oddhead}{}%
   \renewcommand{\@oddfoot}{\raisebox{-10mm}{\usebox{\irphefoot}}\\}%
   \renewcommand{\@evenhead}{\@oddhead}%
   \renewcommand{\@evenfoot}{\@oddfoot}}
%
%  Make sure that these commands are always available
%
\providecommand{\@evenhead}{}
\providecommand{\@evenfoot}{}
\providecommand{\@oddhead}{}
\providecommand{\@oddfoot}{}
%
% Now make "headings" the active pagestyle
%
\pagestyle{headings}
%
%  Redefine the opening command that will print all
%  info on sender, recipient, subject refs, etc
% 
\renewcommand{\opening}[1]{\thispagestyle{firstpage} %\rule{3mm}{1.5pt}
\vspace*{15mm}
%\parbox[t][15mm][t]{\textwidth}{
    \ifthenelse{\equal{\@yref}{}}               % Senders ref's
     {\@ymail\mbox{\ }\par}{\@yref \hspace{2 cm}\@ymail \par}
%
    \ifthenelse{\equal{\@myref}{}}
     {}{\@myref \par}       % My refs
%
   \ifthenelse{\equal{\@objet}{}}               % Objet de la lettre
     {}{\@objet \\}
%     }
\par 
\vspace{4mm}
#1 \par \nobreak
\setlength{\parindent}{1cm}
}                                              % End of renewcommand opening
%
%
% Redefine closing command
\renewcommand{\closing}[1]{\par\nobreak\vspace{2\parskip}%
  \stopbreaks
  \noindent
  \newlength{\sigboxwidth}              % Width of signature box
  \newlength{\sigindent}                % Indent of signature box
       \ifthenelse{\boolean{@frenchstyle}}
         {\setlength{\sigindent}{1,0cm}} {\setlength{\sigindent}{3cm}}
  \setlength{\sigboxwidth}{\textwidth}
  \addtolength{\sigboxwidth}{-0.5cm}
  \parbox{\sigboxwidth} {\hspace*{\sigindent} #1 %
    \par \vspace{9\medskipamount}
       \hspace*{8cm}
        \ifthenelse{\equal {\fromsig}{}}
	   {\fromname \par} {\fromsig \par} 
        \ifthenelse{\equal {\@mytitle}{}}
	   {} {\hspace*{8cm} \@mytitle \par}     
    } \par % End of parbox
        \vspace{\fill}
    }      % End of closing
%
