FROM rust:1.80 as builder
WORKDIR /usr/src/app
COPY . .
RUN cargo build --release

FROM debian:bookworm-slim
WORKDIR /app
COPY --from=builder /usr/src/app/target/release/rust-service .
EXPOSE 3004
CMD ["./rust-service"]
