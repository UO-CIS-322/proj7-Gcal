#
#  Compile web-site assets
#
#  Largely this means concatenating and 'minifying' some javascript and css 
#  assets to reduce browser load time (fewer http requests). 
#

# Configuration options
#
# Edit to use most recent version of Pyvenv on platform  
PYVENV = pyvenv-3.4


# A locally installed copy of browserify
BROWSERIFY=static/js/node_modules/browserify/bin/cmd.js

#
#  The files we generate at build-time
# 
DERIVED = static/js/*.min.js static/js/node_modules

##
## Install in a new environment:
##     We need to rebuild the Python environment to match
##     Everything is straightforward EXCEPT that we need 
##     to work around an ubuntu bug in pyvenv on ix
##     
install:
	$(PYVENV)  env
	(.  env/bin/activate; pip install -r requirements.txt)
	(cd static/js ; npm install)
	$(BROWSERIFY) static/js/busy.js >static/js/busy.min.js

dist:
	pip freeze >requirements.txt

##
## Make a clean start 
##
clean:	
	rm -rf $(DERIVED)

##
## Recipes for components 
## 

## Combine and minify javascript files with browserify
%.min.js:	%.js
	$(BROWSERIFY) $< > $@
