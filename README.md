[![make](https://github.com/yegor256/ppt-slides/actions/workflows/l3build.yml/badge.svg)](https://github.com/yegor256/ppt-slides/actions/workflows/l3build.yml)
[![CTAN](https://img.shields.io/ctan/v/ppt-slides)](https://ctan.org/pkg/ppt-slides)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/yegor256/ppt-slides/blob/master/LICENSE.txt)

This LaTeX package helps you create slide decks as good looking
as with [PowerPoint™](https://en.wikipedia.org/wiki/Microsoft_PowerPoint),
but more precise, uniform, and visually strict.
Check [this series of lectures](https://github.com/yegor256/ssd16)
fully designed with the use of this package.

First, [install it](https://en.wikibooks.org/wiki/LaTeX/Installing_Extra_Packages)
from [CTAN](https://ctan.org/pkg/ppt-slides)
and then use in preamble:

```tex
\documentclass{article}
\usepackage{clicks}
\usepackage[template,scheme=dark]{ppt-slides}
\begin{document}
\plick{\pptBanner{This Is My First Slide}}
\plick{The slide tells you an interesting story...}
\plick{but slowly...}
\plick{step by step...}
\plush{until you get totally bored.}
\end{document}
```

Otherwise, you can download [`ppt-slides.sty`](https://raw.githubusercontent.com/yegor256/ppt-slides/gh-pages/ppt-slides/ppt-slides.sty) and add to your project.

If you want to contribute yourself, make a fork, then create a branch,
then run `l3build ctan` in the root directory.
It should compile everything without errors. If not, submit an issue and wait.
Otherwise, make your changes and then run `l3build ctan` again. If the build is
still clean, submit a pull request.
