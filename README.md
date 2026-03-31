# cuda-image-blur
CUDA-based image blur implementation in C++ for learning neighborhood operations, convolution basics, and GPU acceleration.

A practical CUDA C++ project for image blurring on the GPU.

This repository is designed for developers who want to understand neighborhood operations and basic convolution-style image filtering with CUDA.

## Features

- GPU-based image blur
- neighborhood pixel sampling
- beginner-friendly CUDA filtering example
- suitable for learning image kernels

## Tech Stack

- C++
- CUDA
- OpenCV

## Project Goal

This project demonstrates:

- how blur filters work in parallel on GPU
- how neighboring pixels are accessed in CUDA
- how CUDA can speed up common image enhancement tasks

## Future Improvements

- Gaussian blur
- shared memory optimization
- video blur pipeline
- Jetson camera integration

## Related Topics

CUDA, Blur, Image Filtering, GPU Programming, C++, OpenCV

## Author

Harry12345123

## More

This repository is part of a broader CUDA image processing series for practical GPU learning.

## Requirements

Before building this project, make sure your system has:

- CUDA Toolkit
- OpenCV
- CMake 3.18 or later
- C++17 compatible compiler

## Build

Use the following commands to compile the project:

```bash
mkdir build
cd build
cmake ..
make -j

Run

After building, run the program with:

./cuda_image_blur input.jpg

Notes
Make sure input.jpg exists in the project root directory.
You can replace the input file with your own image.
The executable name depends on your CMake project configuration.

