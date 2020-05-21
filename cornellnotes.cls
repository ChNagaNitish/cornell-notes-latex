\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cornellnotes}[2020/05/21 Cornell Notes LaTeX class]
\RequirePackage{tcolorbox}
\tcbuselibrary{many}

\LoadClass[a4paper]{article}

\RequirePackage[margin=2cm]{geometry}
\RequirePackage{xparse}
\RequirePackage{paracol}

\RequirePackage{tikz}
\RequirePackage{tikzpagenodes}
\RequirePackage{xcolor}


\columnsep=0.05\textwidth
\setcolumnwidth{.35\textwidth, .6\textwidth}
\setlength{\columnseprule}{0pt}

\renewcommand{\maketitle}{
        \begin{center}
                \begin{tcolorbox}[enhanced,colback=violet!10,colframe=violet!80,fonttitle=\centering\Huge\bfseries\sffamily,nobeforeafter,before=\vfil,after=\vfil,colupper=black,sidebyside align=top,lefthand width=.95\textwidth,colbacktitle=violet!80,opacitybacktitle=1, opacitytext=1,title=\@title,coltitle=white]
                                \centering\large\sffamily \@author\quad$\diamond$\quad\@date
                \end{tcolorbox}
        \end{center}
        \iffalse
        \vspace{3em}
        \begin{paracol}{2}
                \begin{center}
                        \begin{tcolorbox}[colback=white,colframe=red!25,width=0.2\textwidth,before skip=0pt]
                                \begin{center}
                                        \huge CUES
                                \end{center}
                        \end{tcolorbox}
                \end{center}
                \switchcolumn
                \begin{center}
                        \begin{tcolorbox}[colback=white,colframe=blue!25,width=0.3\textwidth,before skip=0pt]
                                \begin{center}
                                        \huge NOTES
                                \end{center}
                        \end{tcolorbox}
                \end{center}
        \end{paracol}
        \fi
        \vspace{2em}
}

\columnsep=0.05\textwidth
\setcolumnwidth{.35\textwidth, .6\textwidth}
\setlength{\columnseprule}{2pt}
\colseprulecolor{red!50!blue}

\def\summary#1{
        \begin{tikzpicture}[overlay,remember picture,inner sep=0pt, outer sep=0pt]
                \node[anchor=south,yshift=-1ex] at (current page text area.south) {% 
                        \begin{minipage}{\textwidth}%%%%
                                \begin{tcolorbox}[colframe=white,opacityback=0]
                                        \begin{tcolorbox}[enhanced,colback=teal!10,colframe=teal!80,fonttitle=\large\bfseries\sffamily,nobeforeafter,before=\vfil,after=\vfil,colupper=black,sidebyside align=top,lefthand width=.95\textwidth,colbacktitle=teal!80,opacitybacktitle=1, opacitytext=1,
                                        title=Summary,coltitle=white
                                        ]
                                                #1
                                        \end{tcolorbox}
                                \end{tcolorbox}
                        \end{minipage}
                };
        \end{tikzpicture}
        \pagebreak
}

\DeclareDocumentCommand\cuetemp{g}{
        \begin{center}
                \vspace*{\fill}
                \begin{tcolorbox}[colback=red!05,colframe=red!25,width=0.35\textwidth,before skip=0pt]
                        #1
                \end{tcolorbox}%
                \vspace*{\fill}
        \end{center}
}
\DeclareDocumentCommand\divider{}{
        \hfill
        \switchcolumn
}
\DeclareDocumentCommand\notetemp{m}{
        \begin{tcolorbox}[breakable,enhanced,colback=blue!05,colframe=blue!25,width=0.6\textwidth,before skip=0pt]
                #1
        \end{tcolorbox}
}
\newenvironment{cuenotes}
{       \newcommand{\cue}[1]{\cuetemp{##1}}
        \newcommand{\note}[1]{\notetemp{##1}}
        \begin{paracol}{2} 
                
}
{            
        \end{paracol}
        \vspace{2em}
}
