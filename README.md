#### run with container

```bash
git clone https://github.com/jobscale/certificate.git
cd certificate
main() {
  docker build . -t local/certificate:0.0.1
  docker run --rm --name certificate --rm -p 443:443 local/certificate:0.0.1
  docker cp certificate:/usr/share/nginx/tls/client.key .
  docker cp certificate:/usr/share/nginx/tls/client.crt .
  curl -k --key client.key --cert client.crt https://127.0.0.1
} && main
```
