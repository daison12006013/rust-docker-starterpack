FROM rust:1.50 as builder
WORKDIR .
COPY . .
RUN cargo install --path myapp/

FROM debian:buster-slim
RUN apt-get update
# RUN apt-get install -y <extra-runtime-dependencies>
RUN rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/myapp /usr/local/bin/myapp

CMD ["myapp"]
