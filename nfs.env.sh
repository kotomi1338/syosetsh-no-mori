# ==============================================================================
# nfs.env
# ==============================================================================
source env.sh
alias docker-compose="docker-compose -p $project_name -f nfs.docker-compose.yml"
