# Path to Oh My Fish install.
set -gx OMF_PATH $HOME/.local/share/omf

# Customize Oh My Fish configuration path.
set -gx OMF_CONFIG $HOME/.config/omf

# Load oh-my-fish configuration.
# source $OMF_PATH/init.fish

# locale
set -gx LC_ALL ja_JP.UTF-8
set -gx LANG en_US.UTF-8

# ls colors
set -Ux LSCOLORS cxfxcxdxbxegedabagacad

# golang
set -x GOPATH ~/golang
set PATH $GOPATH/bin $PATH
set GO_WORKING_DIR $GOPATH/src/github.com/RyotaKatoh/

# CFLAGS
set -gx CFLAGS -I(xcrun --show-sdk-path)/usr/include

# Xcode
alias xcode="open -a Xcode"

# python
alias ip="~/.pyenv/versions/2.7.10/bin/frameworkpython -m IPython"
eval (pyenv init - | source )

# AWS EB
if test -f ~/.AWSKEY;
	cat ~/.AWSKEY | while read line;
		eval (echo $line)
	end
end

# docker
alias docker_clean="docker rm -v (docker ps -aq -f status=exited)"

# NVM
set -gx NVM_DIR (brew --prefix nvm)
# nodebrew
set PATH $HOME/.nodebrew/current/bin $PATH

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

# DYLD_LIBRARY_PATH
set -x DYLD_FALLBACK_LIBRARY_PATH $HOME/anaconda/lib $DYLD_FALLBACK_LIBRARY_PATH

# CUDA
if test -f /Developer/NVIDIA;
	set -gx CUDA_HOME /Developer/NVIDIA/CUDA-7.5
	set -gx DYLD_LIBRARY_PATH $DYLD_LIBRARY_PATH:$CUDA_HOME/lib:/usr/local/cuda/lib:
	set -gx PATH $CUDA_HOME/bin $PATH
end

# spark
set -gx PYSPARK_DRIVER_PYTHON ipython

# nginx deploy
alias fab_nginx="docker run --rm -it -v '$PWD:/app' -v '$HOME/.ssh:/root/.ssh' -v '$HOME/.aws:/root/.aws' enm10k/docker-fabric-toolkit fab"

# octave
alias octave="docker run --rm -it -v (pwd):/source schickling/octave"

# luigi
alias run_luigi="docker run -v $PWD:/etc/luigi -p 8082:8082 axiom/docker-luigi"

# grpc
set PATH /etc/protoc-3.3.0-osx-x86_64/bin/ $PATH

# secret token
if test -f ~/.SECRET_TOKEN;
        cat ~/.SECRET_TOKEN | while read line;
                eval (echo $line)
        end
end

# VSCode
function code
  set location "$PWD/$argv"
  open -n -b "com.microsoft.VSCode" --args $location
end

# tmux
alias tcp="tmux save-buffer - | reattach-to-user-namespace pbcopy"

# android studio
set PATH $HOME/Library/Android/sdk/platform-tools/ $PATH

# clean up git branch
alias git_clean="git branch --merged | grep -vE '^\*|master\$|develop\$' | xargs -I % git branch -d %"

# direnv
eval (direnv hook fish)
set -gx EDITOR vim

# SSL CERT
export SSL_CERT_FILE=$HOME/.ca/cafile.pem
export CA_CERT=$SSL_CERT_FILE
export CURL_CA_BUNDLE=$SSL_CERT_FILE
export REQUESTS_CA_BUNDLE=$SSL_CERT_FILE

# rust
eval (source $HOME/.cargo/env)

# yubikey
export GPG_TTY=(tty)
export SSH_AUTH_SOCK=(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
