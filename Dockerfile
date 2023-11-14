FROM tiangolo/uwsgi-nginx-flask:python3.6
RUN pip install redis
run pip install requests
ADD /azure-vote /app

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1