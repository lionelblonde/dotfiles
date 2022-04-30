# Define the pattern according to which we want to filter
# XXX probably due to symbol escaping (or the use of gsed), the quantifiers (e.g. +, *)
# do not seem to work as intended; as a result, we do not use them here, hence the verbosity
# We gain in legibility though, so it might not be all that bad
PATTERN="s/ /-/g; s/_/-/g; s/^20//; s/\([0-9]\)-\([0-9]\)/\1\2/g; s/\([0-9x]\)-xx/\100/g; s/(//g; s/)//g; s/--/-/g; "
PATTERN+="s/[\',\",\,,\:,\;]//g; s/^\([A-Z]\)\([a-z]\)/\L\1\2/; s/\([a-z]\)\([A-Z]\)/\L\1-\L\2/g; s/[A-Z]/\L&/g"
# XXX this is the code necessary to escape the regex; keep here!
# ESCAPED="$(echo ${PATTERN} | gsed 's/[][()\.^$?*+]/\\&/g')"
# echo ${ESCAPED}

# Iterate (non-recursively) over the files in the current directory
for file in *; do
    # Print the file name
    echo "original:" ${file};
    # Modify the name of the file and print it to check it is as intended
    NEWNAME="$(echo "${file}" | gsed "${PATTERN}")"
    echo "renamed: " ${NEWNAME}

    read -p "OK to rename? [y/N]" -n 1 -r
    echo  # start a new line after the prompt
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        mv "${file}" "$(echo "${file}" | gsed "${PATTERN}")"
        echo "renamed! bye for now."
    fi
done
echo "renaming done. bye."
