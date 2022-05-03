from multiprocessing import cpu_count

# SYSTEM VALUES
CPU_CORES = cpu_count()

# GUNICORN SETTINGS
bind = "0.0.0.0:8080"
workers_per_core = 4
workers = 1 + (CPU_CORES * workers_per_core)
threads = 2 * CPU_CORES
worker_class = "gevent"
wsgi_app = "wsgi"
