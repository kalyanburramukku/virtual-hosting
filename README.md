# virtual-hosting
## 7771 is docker port and 80 is external traffic port
### web virtual hosting
### replace domain1.com and domain2.com with your domains
```
docker build -t vhosts .
docker run --name vhosts -d -p7771:80 vhosts:latest
```