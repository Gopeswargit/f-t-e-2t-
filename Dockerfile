# সি++ এবং পাইথন ডেভেলপমেন্টের জন্য শক্তিশালী বেস ইমেজ
FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-22.04

# এনভায়রনমেন্ট সেটআপ
ENV DEBIAN_FRONTEND=noninteractive

# রুট ইউজার হিসেবে সব ইন্সটল করা যাতে পারমিশন এরর না হয়
USER root

# প্রয়োজনীয় সব ইঞ্জিনিয়ারিং ও ম্যাথ টুলস ইন্সটল করা
# libeigen-dev এর পরিবর্তে libeigen3-dev ব্যবহার করা হয়েছে যা সঠিক প্যাকেজ নাম
RUN apt-get update && apt-get install -y \
    cmake \
    g++ \
    python3-pip \
    python3-dev \
    libomp-dev \
    libeigen3-dev \
    libboost-all-dev \
    libopencv-dev \
    mesa-common-dev \
    libglu1-mesa-dev \
    freeglut3-dev \
    git \
    curl \
    wget \
    nodejs \
    npm \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# পাইথনের জন্য ভারী গাণিতিক লাইব্রেরিগুলো আগে থেকেই ইন্সটল করা
RUN pip3 install --no-cache-dir numpy scipy matplotlib sympy pandas

# কাজের ডিরেক্টরি সেট করা
WORKDIR /workspace

# কাজ শেষে আবার মূল ইউজারে ফিরে যাওয়া
USER vscode
