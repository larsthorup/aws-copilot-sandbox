sed \
  "s|process.env.API_ORIGIN|\"${API_ORIGIN}\"|; s|process.env.DEPLOY_ENV|\"${DEPLOY_ENV}\"|" \
  /usr/share/nginx/html/index.html > index.html
cat index.html
mv index.html /usr/share/nginx/html/index.html
nginx -g "daemon off;"