# Use an official Node.js runtime as a parent image
FROM node:18 AS base

# Install Bun
RUN curl -fsSL https://bun.sh/install | bash

# Ensure Bun is in the PATH
ENV PATH="/root/.bun/bin:${PATH}"

# Set the working directory in the container
WORKDIR /app

# Copy the application files to the working directory
COPY . .

# Install Bun dependencies
RUN bun install

# Build the application (if applicable)
RUN bun run build

# Expose port (replace 3000 with your application's port)
EXPOSE 3000

# Command to run your application
CMD ["bun", "run", "start"]
