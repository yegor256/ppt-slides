module = "ppt-slides"
ctanupload = true
typesetopts = "-interaction=batchmode -shell-escape -halt-on-error"
checkopts = "-interaction=batchmode -shell-escape -halt-on-error"
checkengines = {"pdftex"}
tagfiles = {"build.lua", "ppt-slides.dtx"}
docfiles = {"socrates.jpg", "ppt-templates", "ppt-schemes"}
cleanfiles = {"build", "_docshots", "*.run.xml", "*.log", "*.crumbs", "*.bcf", "*.glo", "*.fls", "*.idx", "*.out", "*.fdb_latexmk", "*.aux", "*.sty", "*.zip", "ppt-slides.pdf"}
typesetruns = 2

uploadconfig = {
  update = true,
  confirm = true,
  announcement = "",
  pkg = "ppt-slides",
  version = "0.2.0",
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
