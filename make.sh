# destroy the existing image
docker rmi my-rust-app

# build it again
docker build -t my-rust-app .
