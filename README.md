[![make](https://github.com/yegor256/ppt/actions/workflows/latexmk.yml/badge.svg)](https://github.com/yegor256/ppt/actions/workflows/latexmk.yml)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/yegor256/ppt/blob/master/LICENSE.txt)

This LaTeX package helps you create slide decks as good looking
as with PowerPoint, but more strict. Check
[this series of lectures](https://github.com/yegor256/ssd16)
fully designed with this package.

First, [install it](https://en.wikibooks.org/wiki/LaTeX/Installing_Extra_Packages)
from [CTAN](https://ctan.org/pkg/ppt)
and then use in the preamble:

```tex
\documentclass{article}
\usepackage{clicks}
\usepackage[template=dark]{ppt}
\begin{document}
\plick{\pptBanner{This Is My First Slide}}
\plick{The slide tells you an interesting story...}
\plick{but slowly...}
\plick{step by step...}
\plush{until you get totally bored.}
\end{document}
```

The full example and all commands are available in the 
[`ppt.tex`](https://github.com/yegor256/ppt/blob/master/ppt.tex) file.

If you want to contribute yourself, make a fork, then create a branch, 
then run `make` in the root directory.
It should compile everything without errors. If not, submit an issue and wait.
Otherwise, make your changes and then run `make` again. If the build is
still clean, submit a pull request.
