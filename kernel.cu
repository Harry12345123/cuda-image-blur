#include <cuda_runtime.h>
__global__ void blur_kernel(const unsigned char *in, unsigned char *out, int w, int h, int c)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x >= w || y >= h)
        return;
    for (int ch = 0; ch < c; ++ch)
    {
        int sum = 0, count = 0;
        for (int ky = -1; ky <= 1; ++ky)
        {
            for (int kx = -1; kx <= 1; ++kx)
            {
                int nx = x + kx, ny = y + ky;
                if (nx >= 0 && nx < w && ny >= 0 && ny < h)
                {
                    sum += in[(ny * w + nx) * c + ch];
                    count++;
                }
            }
        }
        out[(y * w + x) * c + ch] = static_cast<unsigned char>(sum / count);
    }
}
void blur_cuda(const unsigned char *in, unsigned char *out, int width, int height, int channels)
{
    size_t bytes = width * height * channels;
    unsigned char *d_in = nullptr, *d_out = nullptr;
    cudaMalloc(&d_in, bytes);
    cudaMalloc(&d_out, bytes);
    cudaMemcpy(d_in, in, bytes, cudaMemcpyHostToDevice);
    dim3 block(16, 16);
    dim3 grid((width + 15) / 16, (height + 15) / 16);
    blur_kernel<<<grid, block>>>(d_in, d_out, width, height, channels);
    cudaDeviceSynchronize();
    cudaMemcpy(out, d_out, bytes, cudaMemcpyDeviceToHost);
    cudaFree(d_in);
    cudaFree(d_out);
}