#!/usr/bin/env bash

original_files_dir="/usr/share/X11/xkb/symbols"
tweaked_files_dir="./xkb-altgr-hjkl/X11/xkb/symbols"

tweaked_us_path="${tweaked_files_dir}/us"
tweaked_es_path="${tweaked_files_dir}/es"
tweaked_gb_path="${tweaked_files_dir}/gb"
original_us_path="${original_files_dir}/us"
original_es_path="${original_files_dir}/es"
original_gb_path="${original_files_dir}/gb"

replace_us_cmd="sudo cp ${tweaked_us_path} ${original_us_path}"
replace_es_cmd="sudo cp ${tweaked_es_path} ${original_es_path}"
replace_gb_cmd="sudo cp ${tweaked_gb_path} ${original_gb_path}"

echo "This script is a workaround until you figure out why symlinking these"
echo "files breaks GNOME."
echo ""
echo "The script will REPLACE (delete and copy) the original XKB symbols"
echo "of the US, ES and UK keyboard layouts with the files in"
echo "this directory."
echo ""

# Ensure tweaked files exist
if [ ! -f "${tweaked_us_path}" ]; then
    echo "ERROR: expected US symbols (${tweaked_us_path}) not found"
    exit 1
fi
if [ ! -f "${tweaked_es_path}" ]; then
    echo "ERROR: expected ES symbols (${tweaked_es_path}) not found"
    exit 1
fi
if [ ! -f "${tweaked_gb_path}" ]; then
    echo "ERROR: expected GB symbols (${tweaked_gb_path}) not found"
    exit 1
fi

echo "The following commands will be executed:"
echo "  ${replace_us_cmd}"
echo "  ${replace_es_cmd}"
echo "  ${replace_gb_cmd}"
echo "You must see the word 'END' if the script runs to completion."
echo ""

echo "Press ENTER to proceed or Ctrl+C to abort:"
read dumb_variable

eval $replace_us_cmd
eval $replace_es_cmd
eval $replace_gb_cmd

echo "END"
