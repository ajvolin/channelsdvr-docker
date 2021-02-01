FROM alpine:3.13
LABEL maintainer="Adam Volin <ajvolin@gmail.com>"

# Update apk and add dependencies
RUN apk add --update --no-cache \
                        curl \
                        tzdata \
                        chromium \
                        xvfb

# Remove Cache
RUN rm -rf /var/cache/apk/*

# Prepare directory
RUN mkdir -p /channels-dvr/data

# Get installer & run scripts
RUN wget https://raw.githubusercontent.com/ajvolin/channelsdvr-docker/main/run.sh
RUN chmod o+x ./run.sh

# Indicate port to expose
EXPOSE 8089

# Register app entry point
ENTRYPOINT ["./run.sh"]

# Register healthcheck
HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:8089/status
