--[==========================[--
   L3BUILD FILE FOR HDUTHESIS
--]==========================]--

function copyctan()
  local pkgdir = ctandir .. "/" .. ctanpkg
  mkdir(pkgdir)

  -- Handle pre-formed sources: do two passes to avoid any cleandir() issues
  for _,dest in pairs(tdsdirs) do
    mkdir(pkgdir .. "/" .. dest)
  end
  for src,dest in pairs(tdsdirs) do
    cp("*",src,pkgdir .. "/" .. dest)
  end

  -- Now deal with the one-at-a-time files
  local function copyfiles(files,source)
    if source == currentdir or flatten then
      for _,filetype in pairs(files) do
        cp(filetype,source,pkgdir)
      end
    else
      for _,filetype in pairs(files) do
        for _,p in ipairs(tree(source,filetype)) do
          local path = dirname(p.src)
          local ctantarget = pkgdir .. "/"
            .. source .. "/" .. path
          mkdir(ctantarget)
          cp(p.src,source,ctantarget)
        end
      end
    end
  end
  for _,tab in pairs(
    {bibfiles,demofiles,docfiles,pdffiles,scriptmanfiles,typesetlist}) do
    copyfiles(tab,docfiledir)
  end
  copyfiles(sourcefiles,sourcefiledir)
  for _,file in pairs(textfiles) do
    cp(file, textfiledir, pkgdir)
  end

end

module             = "hduthesis"
packtdszip         = true
flatten            = false
flattentds         = false
sourcefiledir      = "source"
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