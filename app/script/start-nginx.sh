sed \
  "s|process.env.GREET_BASE_URL|\"${GREET_BASE_URL}\"|; s|process.env.DEPLOY_ENV|\"${DEPLOY_ENV}\"|" \
  /usr/share/nginx/html/index.html > index.html
mv index.html /usr/share/nginx/html/index.html
cat /usr/share/nginx/html/index.html
nginx -g "daemon off;"