\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cornellnotes}[2020/05/21 Cornell Notes LaTeX class]
\RequirePackage{tcolorbox}
\tcbuselibrary{many}

\RequirePackage{xparse}
\RequirePackage{paracol}
\RequirePackage{tikz}
\RequirePackage{tikzpagenodes}
\RequirePackage{xcolor}
\RequirePackage{ifthen}

\newcommand{\mycol}{blue}
\newcommand{\switcher}{black}
\newcommand{\customcol}{white}

\DeclareOption{dark}{\renewcommand{\customcol}{black!70}}
\DeclareOption{tiles}{\renewcommand{\switcher}{white}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper]{article}


\RequirePackage[margin=2cm]{geometry}


\columnsep=0.05\textwidth
\setcolumnwidth{.35\textwidth, .6\textwidth}
\setlength{\columnseprule}{0pt}
\newcommand{\customtext}{black}
\ifthenelse{ \equal{\customcol}{white} }{
        \renewcommand{\customtext}{black}
}{
        \renewcommand{\customtext}{white}
        \pagecolor{black}
        \color{white}
}

\columnsep=0.05\textwidth
\setcolumnwidth{.35\textwidth, .6\textwidth}
\setlength{\columnseprule}{2pt}
\colseprulecolor{teal!50!\customcol}

\renewcommand{\maketitle}{
        \begin{center}
                \begin{tcolorbox}[enhanced,colback=violet!10!\customcol,colframe=violet!80!\customcol,opacityback=1,fonttitle=\centering\Huge\bfseries\sffamily,nobeforeafter,before=\vfil,after=\vfil,colupper=black,sidebyside align=top,lefthand width=.95\textwidth,colbacktitle=violet!80!\customcol,opacitybacktitle=1, opacitytext=1,title=\@title,coltext=\customtext,coltitle=white]
                        \centering\large\sffamily \@author\quad$\diamond$\quad\@date
                \end{tcolorbox}
        \end{center}
        \ifthenelse{ \equal{\switcher}{white}}{
        \setlength{\columnseprule}{0pt}
        \vspace{3em}
        \begin{paracol}{2}
                \begin{center}
                        \begin{tcolorbox}[colback=\customcol,colframe=red!25!\customcol,coltext=\customtext,width=0.2\textwidth,before skip=0pt]
                                \begin{center}
                                        \huge CUES
                                \end{center}
                        \end{tcolorbox}
                \end{center}
                \switchcolumn
                \begin{center}
                        \begin{tcolorbox}[colback=\customcol,colframe=blue!25!\customcol,coltext=\customtext,width=0.3\textwidth,before skip=0pt]
                                \begin{center}
                                        \huge NOTES
                                \end{center}
                        \end{tcolorbox}
                \end{center}
        \end{paracol}
        }{}
        \setlength{\columnseprule}{2pt}
        \vspace{2em}
}


\def\summary#1{
        \begin{tikzpicture}[overlay,remember picture,inner sep=0pt, outer sep=0pt]
                \node[anchor=south,yshift=-1ex] at (current page text area.south) {% 
                        \begin{minipage}{\textwidth}%%%%
                                \begin{tcolorbox}[opacityframe=0,opacityback=0]
                                        \begin{tcolorbox}[enhanced,colback=teal!10!\customcol,colframe=teal!80,fonttitle=\large\bfseries\sffamily,nobeforeafter,before=\vfil,after=\vfil,sidebyside align=top,lefthand width=.95\textwidth,colbacktitle=teal!80!\customcol,opacitybacktitle=1, opacitytext=1,
                                        title=Summary,coltext=\customtext,coltitle=white]
                                                #1
                                        \end{tcolorbox}
                                \end{tcolorbox}
                        \end{minipage}
                };
        \end{tikzpicture}
        \pagebreak
}

\DeclareDocumentCommand\cue{g}{
        \begin{leftcolumn*}[]\noindent
                \begin{center}
                        \vspace*{\fill}
                        \IfNoValueF {#1}{
                        \begin{tcolorbox}[colback=red!05!\customcol,colframe=red!25!\customcol,coltext=\customtext,width=0.35\textwidth,before skip=0pt]
                                #1
                        \end{tcolorbox}%
                        }
                        \vspace*{\fill}
                \end{center}
        \end{leftcolumn*}
        \ifthenelse{ \equal{\mycol}{cyan} }{
                \renewcommand{\mycol}{blue}
        }{
                \renewcommand{\mycol}{cyan}
        }
}

\DeclareDocumentCommand\note{m}{
        \begin{rightcolumn}\noindent
                \begin{tcolorbox}[breakable,enhanced,colback=\mycol!05!\customcol,colframe=\mycol!25!\customcol,coltext=\customtext,width=0.6\textwidth,before skip=0pt]
                                #1
                \end{tcolorbox}
        \end{rightcolumn}
}

\newenvironment{cuenotes}
{
        \begin{paracol}{2}

                
}
{            
        \end{paracol}
}
