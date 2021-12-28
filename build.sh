# Verify script args
export DEPLOY_ENV=$1
echo "local demo live" | grep -w -q "${DEPLOY_ENV}" || { echo Unexpected env \"${DEPLOY_ENV}\"; exit 1; }

# Load .env for specified environment
export $(egrep -v '^#' .env.${DEPLOY_ENV} |  tr -d '\r' | xargs)

# Build app
(cd app && sh build.sh)