# StringWrapper

This repo contains two scripts for use with whitequark's Ruby parsing library: one which wraps strings with `_()`, the method used by the gettext gem to identify strings which need to be extracted into a POT file, and another which processes those wrapped strings to extract interpolated values into Ruby's string formatting syntax.

Run the string extractor with `ruby-rewrite -m --load string_wrapper.rb <file_or_dir_to_mark>`. This will modify the file(s) in place.
Follow up with `ruby-rewrite -m --load interpolation_extracter.rb <file_or_dir_to_process>`.

Eventually these two scripts will most likely be combined.

Note: the changes made by this script still need a thorough manual review, to ensure that _only_ strings that need to be externalized are marked. More sophisticated matching criteria will be added as they are discovered through use of the script on complex files.

For more info on the parser/rewriter, see <https://github.com/whitequark/parser>.
