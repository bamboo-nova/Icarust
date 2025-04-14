# Build stage: Compile binary in official Rust image
FROM rust:1.86 as builder
WORKDIR /app
COPY . .
RUN cargo build --release

# Runtime stage: Distroless for security and small image
FROM gcr.io/distroless/cc
COPY --from=builder /app/target/release/icarust /icarust
EXPOSE 8080
CMD ["/icarust"]
