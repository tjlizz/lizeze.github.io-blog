cd  /code/my-blog
git checkout .
git pull
npm run  build
rm -rf /usr/share/nginx/html/blog/*
cp -r ./public/* /usr/share/nginx/html/blog/