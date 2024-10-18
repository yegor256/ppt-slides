-- The MIT License (MIT)
--
-- Copyright (c) 2021-2024 Yegor Bugayenko
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included
-- in all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

module = "ppt-slides"
ctanupload = true
typesetopts = "-interaction=batchmode -shell-escape -halt-on-error"
checkopts = "-interaction=batchmode -shell-escape -halt-on-error"
checkengines = {"pdftex", "luatex", "xetex"}
tagfiles = {"build.lua", "ppt-slides.dtx"}
docfiles = {"socrates.jpg", "ppt-templates", "ppt-schemes"}
cleanfiles = {"build", "_docshots", "*.run.xml", "*.log", "*.crumbs", "*.bcf", "*.glo", "*.fls", "*.idx", "*.out", "*.fdb_latexmk", "*.aux", "*.sty", "*.zip", "ppt-slides.pdf"}
typesetruns = 2
checkruns = 2

uploadconfig = {
  update = true,
  confirm = true,
  announcement = "",
  pkg = "ppt-slides",
  version = "0.0.0",
  author = "Yegor Bugayenko",
  uploader = "Yegor Bugayenko",
  email = "yegor256@gmail.com",
  note = "Bug fixes",
  ctanPath = "/macros/latex/contrib/ppt-slides",
  bugtracker = "https://github.com/yegor256/ppt-slides/issues",
  description = "This LaTeX package helps you create slide decks as good-looking as with PowerPoint™, but more precise, uniform, and visually strict. Check <a href='https://github.com/yegor256/ssd16'>this series of lectures</a> fully designed with the use of this package.",
  license = "mit",
  summary = "Good-looking slide decks à la PowerPoint (PPT)",
  repository = "https://github.com/yegor256/ppt-slides",
  topic = {"presentation"}
}

function update_tag(file, content, tagname, tagdate)
  return string.gsub(
    string.gsub(content, "0%.0%.0", tagname),
    "0000%-00%-00", os.date("%Y-%m-%d")
  )
end
