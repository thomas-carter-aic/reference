FROM golang:1.23-alpine
WORKDIR /app
COPY . .
RUN go mod init go-service && go mod tidy && go build -o app
EXPOSE 3002
CMD ["./app"]
