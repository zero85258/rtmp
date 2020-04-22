docker run --name nginx -p 8080:80 -p 1935:1935 -v "$PWD":/usr/share/nginx/html -w /usr/share/nginx/html -d nginx
#docker run --rm -it -p 8080:80 -v "$PWD":/usr/share/nginx/html -w /usr/share/nginx/html ubuntu bash
