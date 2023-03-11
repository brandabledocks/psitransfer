#!/bin/sh

# please note all of this must be done in sync, not any async tasks allowed, as this will make the app.js load before all
# branding configuration has been done.

# step 1
# load config from .branding/branding/branding.json

# step 2
# now go through all files in config.files<from, to> and copy it from selected destination to the new destination, allow file overwriting.
# example replacing this footer with a custom
rm -f /app/public/pug/partials/footer.pug && cp ./.branding/branding/public/pug/partials/footer.pug /app/public/pug/partials/footer.pug
# before placing the new file content, it should go through the env variables and for anyone that starts with "BRANDING_",
# it should search for the env variable name and replace with the variable value.
# example a env "BRANDING_PRIMARY_COLOR=red" should search the file "footer.pub" for "BRANDING_PRIMARY_COLOR" and replace it with "red".

# step 3
# now go through all files in config.appends<from, to>, this should append the content from one file to another, however it should ONLY
# do so if the content is not already there.
# example adding custom CSS to end of styles.css.
CONTENT=`cat ./.branding/branding/public/assets/styles.css`
echo "content $CONTENT"
FILE='/app/public/assets/styles.css'
echo $FILE;
echo "$CONTENT" >> "$FILE"
# before placing the new file content, it should go through the env variables and for anyone that starts with "BRANDING_",
# it should search for the env variable name and replace with the variable value.
# example a env "BRANDING_PRIMARY_COLOR=red" should search the file "styles.css" for "BRANDING_PRIMARY_COLOR" and replace it with "red".

# step 4
# go through all replacements in config.replace<search, replace, in>, this should search using regex format, and replace the content.
# it should go over all the files listed in the "in" array.
# no example provided.
# before placing the new file content, it should go through the env variables and for anyone that starts with "BRANDING_",
# it should search for the env variable name and replace with the variable value.
# example a env "BRANDING_PRIMARY_COLOR=red" should search the file the new content for "BRANDING_PRIMARY_COLOR" and replace it with "red".
