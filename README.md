shaform's master thesis
=======

## About the template

This is copy from @qcl 's [qcl-master-thesis](https://github.com/qcl/qcl-master-thesis).
Which is copy from @tzhuan 's [臺灣大學碩博士論文 XeLaTeX 模板](https://github.com/tzhuan/ntu-thesis). 
And copy some part of [台大碩博士論文LaTeX範本](https://code.google.com/p/ntu-thesis-latex-template/).

## How to compile
### Ubuntu

* 安裝 XeLaTex
    * sudo apt-get install texlive texlive-xetex texlive-latex-recommended texlive-latex-extra texlive-bibtex-extra texlive-science texlive-humanities pdftk
* 安裝字形（標楷體、Times New Roman）
    * sudo mkdir -p /usr/share/fonts/truetype/win/ 
    * sudo cp [WINDOWS]/Windows/Fonts/kaiu.ttf /usr/share/fonts/truetype/win/
    * sudo cp [WINDOWS]/Windows/Fonts/times\*.ttf /usr/share/fonts/truetype/win/
    * fc-cache
    * fc-list //for check
* 編譯
    * make
* 編譯送圖書館版本（加上浮水印、保全）
    * make ntulib

### Mac OS

* 安裝 [MacTEX](https://tug.org/mactex/)
* 安裝 [PDFtk](http://www.pdflabs.com/tools/pdftk-server/)
* 編譯
    * make
* 編譯送圖書館版本（加上浮水印、保全）
    * make ntulib

### Windows

* 留下字形檔案，下載 [Ubuntu](http://www.ubuntu.com/) 並安裝或找一台[蘋果電腦](http://www.apple.com/tw/mac/)。
