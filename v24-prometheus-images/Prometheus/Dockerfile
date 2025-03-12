# Use the official Prometheus image from Docker Hub
FROM prom/prometheus

# Set the working directory
WORKDIR /etc/prometheus

# Copy the Prometheus configuration file from the host to the container
COPY config/prometheus.yaml /etc/prometheus/prometheus.yaml

# Expose the Prometheus port
EXPOSE 9090

# Set the command to start Prometheus with the specified configuration file
CMD ["--config.file=/etc/prometheus/prometheus.yaml"]
