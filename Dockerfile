# Minimal Docker image for FastANI using Alpine base
FROM alpine:latest

# install FastANI
RUN apk update && \
    apk add --no-cache bash cmake gcc g++ git gsl-dev make musl-dev zlib-dev && \
    git clone --recursive https://github.com/ParBLiSS/FastANI.git && \
    cd FastANI && \
    mkdir build && \
    cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release && \
    cmake --build . && \
    make install && \
    cd ../.. && \
    rm -rf FastANI
