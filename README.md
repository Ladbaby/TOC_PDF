# Shell Script for [pdf.tocgen](https://github.com/Krasjet/pdf.tocgen)

[pdf.tocgen](https://github.com/Krasjet/pdf.tocgen) is "A CLI toolset to generate table of contents for PDF files (semi?) automatically"

However, the usage of its commands seems to be not so convinient. To further speedup the process and make its usage more intuitive, this shell script is used.

## Highlights

- Intuitive interface
- No need to copy the source pdf file to script's path (**Even in WSL**)
- No need to copy the output file back to source file's path


## Compatibility

**Optimized for Windows Subsystem for Linux**. Also works in pure Linux (sounds strange right? see the usage section).

## Installation

Please refer to [pdf.tocgen](https://github.com/Krasjet/pdf.tocgen)'s installation instruction

## Usage

After changing to the script's path:
```shell
sh TOC_PDF.sh
```

e.g.

```
-----TOC generator for PDF-----
Enter the file name:"C:\Users\UserName\Apps\Zotero\database\storage\3XCKGZAK\Yang et al_2022_Diffusion Models.pdf"
Enter the maximum depth of TOC (default: 2):1
Enter the page number of level 1's title  (default: 1):3
Enter the title name of level 1 (default: "Introduction"):INTRODUCTION
-----PDF file with TOC has been generated!-----
```

which will output the result file to the source file's folder, with the name suffix `_output.pdf`

> 💡There's **no need to copy the source file to script's folder**! When specifying the file name (absolute path), **Windows file path is supported**! which will automatically be convert it to `/mnt/...`. Linux file path (e.g., `../filename.pdf`) is also supported


