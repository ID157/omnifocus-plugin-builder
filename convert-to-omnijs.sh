#!/bin/sh
IFS="
"
source ./.env
omnifocus_plugin_dir="dist"
files=`find dist -name \*.js -type f -exec bash -c "echo {}" \;`
for file in $files
do
  script_name=`echo $file | sed -E 's/dist\/(.+)\.js/\1/'`
  omni_metadata="\/\* global PlugIn Form Task \*\/
\/\*{
  \"type\": \"action\",      
  \"targets\": [\"omnifocus\"],
  \"author\": \"$OMNIFOCUS_PLUGIN_AUTHOR_NAME\",
  \"identifier\": \"com.omni-automation.of.${script_name}\",
  \"version\": \"1.0\",
  \"description\": \"plugin\",
  \"label\": \"${script_name}\",
  \"shortLabel\": \"${script_name}\"
}\*\/
"

  output_dirname=$OMNIFOCUS_PLUGIN_DIR
  output_filename=`echo $file | sed -E 's/dist\/(.+)\.js/\1\.omnijs/'`
  output="${output_dirname}/${output_filename}"
  cp $file $output

  cnt=0
  for omni_meta_line in $omni_metadata
  do
    let cnt=$cnt+1
    sed -i '' "${cnt}s/^/$omni_meta_line\n/" $output
  done
done
