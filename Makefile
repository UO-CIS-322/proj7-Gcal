#
#  Compile web-site assets
#
#  Largely this means concatenating and 'minifying' some javascript and css 
#  assets to reduce browser load time (fewer http requests). 
#

#
#  The files we generate at build-time
# 
DERIVED = static/css/busy.min.css
CSS-CLEAN = (cd static/js; node_modules/clean-css/bin/cleancss)


##
## Default recipe:  Rebuild whatever needs rebuilding.
## Note this is the default rule --- 'make' alone is same as 'make all'
##
all:	
	(cd static/js; make all)
	make static/css/busy.min.css
##
## Make a clean start --- rebuild the whole 'dist' directory
##
clean:	
	rm -f $(DERIVED)

##
## Recipes for components 
## 


## Concatenate and minify CSS files with cleancss
%.min.css:	%.css
	$(CSS-CLEAN) $<  > $@

## Combine and minify javascript files with browserify
%.min.js:	%.js
	$(BROWSERIFY) $< > $@

## Special case for top-level javascript file
static/js/busy.min.js:  static/js/busy.js
	$(BROWSERIFY) $< --standalone busy > $@
