# Path to Oh My Fish install.
set -gx OMF_PATH /Users/RyotaKatoh/.local/share/omf

# Customize Oh My Fish configuration path.
set -gx OMF_CONFIG /Users/RyotaKatoh/.config/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

# locale
set -gx LC_ALL ja_JP.UTF-8
set -gx LANG en_US.UTF-8

# ls colors
set -Ux LSCOLORS cxfxcxdxbxegedabagacad 

# python
alias ip="~/.pyenv/versions/2.7.10/bin/frameworkpython -m IPython"

# golang
set -x GOPATH ~/golang
set PATH $GOPATH/bin $PATH

# CFLAGS
set -gx CFLAGS -I(xcrun --show-sdk-path)/usr/include

# Spark
set -gx IPYTHON 1
alias spark "~/spark-1.5.2-bin-hadoop2.6/bin/pyspark"

# Xcode
alias xcode="open -a Xcode"

# AWS EB
if test -f ~/.AWSKEY;
	cat ~/.AWSKEY | while read line;
		eval (echo $line)
	end
end


# NVM
set -gx NVM_DIR (brew --prefix nvm)

# git shortcuts
function gs
	git status
end

function ga
	git add $argv
end

function gc
	git commit $argv
end

function gco
	git checkout $argv 
end

function gb
	git branch $argv
end

# utilities
function tz
	totsuzen $argv
end

# haskell
set PATH ~/.local/bin $PATH

# mail config
if test -f ~/.MAILERKEY;
        cat ~/.MAILERKEY | while read line;
                eval (echo $line)
        end
end
