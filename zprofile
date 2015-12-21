exists() {
    for i; do
        which $i >/dev/null 2>&1 || return 1
    done
    return 0
}

if exists ssh-agent; then
    if [[ -z $SSH_AUTH_SOCK ]]; then
        if [[ -f ~/.agent.env ]]; then
            . ~/.agent.env -s > /dev/null
 
            if ! kill -0 $SSH_AGENT_PID > /dev/null 2>&1; then
                ssh-agent -s > ~/.agent.env
                . ~/.agent.env > /dev/null 2>&1
            fi
        else
            ssh-agent -s > ~/.agent.env
            . ~/.agent.env > /dev/null 2>&1
        fi
    fi
fi

export DISPLAY=:0.0

export PATH=/usr/local/heroku/bin:$PATH
proxy=proxyarray.mazdausa.com:80
export http_proxy=$proxy
export HTTP_PROXY=$proxy
export https_proxy=$proxy
export HTTPS_PROXY=$proxy
export DISPLAY=:1.0
umask u=rwx,g=rwx,o=rwx

export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/heroku/bin
export PATH=$PATH:$HOME/ledger
export PATH=$PATH:/usr/local/lib/

export CHROME_DRIVER=$HOME/chromedriver/chromedriver.exe
export DJANGO_LIVE_TEST_SERVER_ADDRESS="localhost:8000-8010,8080,9200-9300"
export EMAIL_HOST_PASSWORD=49nrDfhiNPsWEULBViRq
export EMAIL_HOST_USER=c.giacofei.htpc@gmail.com
