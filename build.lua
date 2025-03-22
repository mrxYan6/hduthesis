--[==========================[--
   L3BUILD FILE FOR HDUTHESIS
--]==========================]--

module             = "hduthesis"
ctanzip            = module
packtdszip         = true
typesetexe         = "xelatex"
installfiles       = {"*.sty", "*.cls", "*.code.tex", "*.pdf"}
typesetdemofiles   = {"./example/*.tex"}
specialtypesetting = specialtypesetting or {}
specialtypesetting["hduthesis-stationery.tex"] =
  {cmd = "pdflatex --shell-escape -interaction=nonstopmode"}
specialtypesetting["hduthesis-beamer.tex"] =
  {cmd = "pdflatex --shell-escape -interaction=nonstopmode"}

uploadconfig = {
  pkg          = module,
  version      = "v1.1.0 2025-03-21",
  author       = "Mingyu Xia",
  uploader     = "Mingyu Xia",
  email        = "myhsia@outlook.com",
  summary      = [[
    LaTeX class for bachelor and MPhil theses in Hangzhou Dianzi University
  ]],
  description  = [[
    This package provides a LaTeX template for graduation theses in Hangzhou Dianzi University. It supports the formatting of bachelor and MPhil degree theses.
  ]],
  license      = "lppl1.3c",  
  ctanPath     = "/macros/latex/contrib/" .. module,
  announcement = [[
    Version 1.1.1 released
    - Fixed the lost of graphics files when installing by tlmgr (x2).
    - Updated the l3build workflow.
    - Reconstructed hdu-graphicx.dtx.
  ]],
  home         = "https://github.com/myhsia/" .. module,
  bugtracker   = "https://github.com/myhsia/" .. module .. "/issues",
  support      = "https://qm.qq.com/q/RGFmHwBecC",
  repository   = "https://github.com/myhsia/" .. module,
  development  = "https://github.com/myhsia",
  update       = true,
}