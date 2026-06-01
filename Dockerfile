FROM node:20-alpine@sha256:fb4cd12c85ee03686f6af5362a0b0d56d50c58a04632e6c0fb8363f609372293

WORKDIR /docs

RUN npm install -g --ignore-scripts mint@4.2.585 \
    && npm cache clean --force

# Drop to the built-in non-root user shipped with the node image
RUN chown -R node:node /docs
USER node

# Expose the default dev server port
EXPOSE 3000

# Run mintlify dev, binding to all interfaces so it's reachable from the host
CMD ["mint", "dev", "--host", "0.0.0.0"]
