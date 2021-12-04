# Verify script args
ENV=$1
echo "local test" | grep -w -q "${ENV}" || { echo Unexpected env \"${ENV}\"; exit 1; }

# Load .env for specified environment
export $(egrep -v '^#' .env.${ENV} |  tr -d '\r' | xargs)

# Build app
(cd app && sh build.sh)