\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mlnotes}[2024/03/18 Machine Learning Notes Class]
\LoadClass[12pt]{article}

% --- Packages --- %
\RequirePackage{darkmode}
\RequirePackage{datetime}
\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage{titlesec}
\RequirePackage{atbegshi} % To access beginning of each page
\RequirePackage{tikz}
\RequirePackage[most]{tcolorbox}
\RequirePackage{varwidth}
\RequirePackage{amsmath, amsthm}
\RequirePackage{titlecaps}

\RequirePackage{imakeidx}
\RequirePackage[hidelinks]{hyperref}

\RequirePackage[T1]{fontenc} % Load font iwona
\RequirePackage{iwona}

% --- Page Setup --- %
\geometry{
  bottom=2cm,
}

% --- Custom Commands --- %
% \item \href{\seeingtheory}{\textcolor{green}{\underline{seeing-theory}}}
\newcommand{\link}[3][green]{
  \href{#2}{\textcolor{#1}{\underline{#3}}}
}

% --- Index --- %
\makeindex[name=defn, title={Definitions}, intoc]

% --- Colors --- %
\definecolor{blue}{HTML}{4842F5}
\definecolor{green}{HTML}{92D485}
\definecolor{forest}{HTML}{344e41}

% --- Custom Title --- %
\newcommand{\@lecture}{0} % Default lecture number
\newcommand{\lecture}[1]{\renewcommand{\@lecture}{#1}}

\newcommand{\@topic}{Untitled Notes} % Default topic name
\newcommand{\topic}[1]{\renewcommand{\@topic}{#1}}

\renewcommand{\@author}{Author Name}
\renewcommand{\author}[1]{\renewcommand{\@author}{#1}}

\newcommand{\@subtitle}{Subtitle Placeholder}
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}

\newlength{\titlelength} % Define a length for the title
\renewcommand{\maketitle}{
  \settowidth{\titlelength}{\Large\textbf{Lecture \@lecture: \@topic}}
  \addtolength{\titlelength}{15pt}

  \begin{center}
    \Large{\textbf{Lecture \@lecture: \@topic}}\\[-1ex] % Use the topic name in the title
    \textcolor{green}{\rule{\titlelength}{4pt}}\\[1ex]
    \normalsize{\textbf{\@author}}\\[1ex]
    \small{\emph{\@subtitle}}
  \end{center}
}

% --- Section --- %
\titleformat{\section}
  {\normalfont\Large\bfseries} % Section title formattig
  {\colorbox{green}{\parbox[c][16pt][c]{30pt}{\hfill\color{white}\thesection}}}
  {10pt}
  {\color{black}}
  [\titleline{\color{green}\titlerule[1pt]}]

% --- Table of Contents --- %
\let\oldtableofcontents\tableofcontents
\renewcommand{\contentsname}{}
\renewcommand\tableofcontents{
  {
    \titleformat{\section}[block] % Temporarily update the title format for sections
      {\normalfont\Large\bfseries}
      {}
      {0pt}
      {}

    \titlespacing*{\section}
      {0pt}
      {0pt}
      {10pt}

    \oldtableofcontents % Output the original table of contents
  }
}

% --- Definitions --- %
\newcounter{definitionnumber}[section]
\renewcommand{\thedefinitionnumber}{\thesection.\arabic{definitionnumber}}

\newcommand{\define}[1]{\index[defn]{\titlecap{#1}}\textbf{#1}}

\tcbuselibrary{breakable}
\tcbuselibrary{theorems}
\tcbuselibrary{skins}

\newtcbtheorem[number within=section]{definition}{Definition}{%
  enhanced,
  frame empty,
  interior empty,
  colframe=blue!80!white,
  coltitle=white,
  fonttitle=\bfseries,
  colbacktitle=blue!80!white,
  borderline={0.5mm}{0mm}{blue!15!white},
  borderline={0.5mm}{0mm}{blue!80!white,dashed},
  attach boxed title to top center={yshift=-2mm},
  boxed title style={boxrule=0.4pt},
  varwidth boxed title,
  separator sign none,
}{defo}