clear

echo "-----\033[42mTOC generator for PDF\033[0m-----"

# prompt for file name
echo -n "Enter the \033[31mfile name\033[0m:"
read -r abs_path_windows
if [ -n "$abs_path_windows" ]; then
    abs_path_linux=$(printf "%s" "$abs_path_windows" | sed 's/\\/\//g; s/\([A-Za-z]\):/\/mnt\/\L\1/')
    abs_path_linux=$(printf "%s" "$abs_path_linux" | sed "s/\"//g")
    
    pdf_file_name=$(basename "$abs_path_linux")
    cp "$abs_path_linux" "."
    destination_path="${abs_path_linux%.pdf}_out.pdf"
    output_file_name="${pdf_file_name%.pdf}_out.pdf"
fi

# prompt for TOC max depth
echo -n "Enter the \033[31mmaximum depth\033[0m of TOC (default: 2):"
read max_depth
max_depth=${max_depth:-2}

# prompt for recipe for each level
for i in $(seq 1 $max_depth); do
    # page number of the title
    echo -n "Enter the \033[31mpage number\033[0m of \033[32mlevel $i\033[0m's title  (default: 1):"
    read page_number
    if [ -n "$page_number" ]; then
        page_number=$(expr "$page_number" + 0)
    fi
    page_number=${page_number:-1}

    # title name
    echo -n "Enter the \033[31mtitle name\033[0m of \033[32mlevel $i\033[0m (default: \"Introduction\"):"
    read title
    title=${title:-"Introduction"}

    # write to recipe.toml
    pdfxmeta -p "${page_number}" -a 1 "${pdf_file_name}" "${title}" >> recipe.toml
done

# generate toc file using recipe
pdftocgen "${pdf_file_name}" < recipe.toml > toc

# edit the generated toc
vim toc

# insert recipe into pdf file
pdftocio "${pdf_file_name}" < toc

mv "$output_file_name" "$destination_path"
rm recipe.toml toc "$pdf_file_name"

echo "-----\033[44mPDF file with TOC has been generated!\033[0m-----"