server {
    listen 80;
    server_name akash.com www.akash.com;

    location / {
        proxy_pass http://localhost:7000; # Replace with your Docker container's internal address
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
