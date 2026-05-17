\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{study-note}[2026/05/17 Study note class for FA lecture notes]

\LoadClass[11pt]{article}

\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=sn,
  prefix=sn@,
}

\DeclareStringOption[Study Notes]{header}
\DeclareBoolOption[true]{theorems}

\ProcessKeyvalOptions*

\input{study-note-style}

\ifsn@theorems
  \input{../../fa-theorems}
\fi

\newcommand{\StudyHeader}{\sn@header}
