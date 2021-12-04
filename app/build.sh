mkdir -p dist
sed "s|process.env.GREET_BASE_URL|\"${GREET_BASE_URL}\"|" src/index.html > dist/index.html