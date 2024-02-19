# GPU_location.sed
# HX2000
s/C4:00.0/logical_GPU_3 physical_GPU1 C4:00.0/
s/c4:00.0/logical_GPU_3 physical_GPU1 C4:00.0/
s/84:00.0/logical_GPU_2 physical_GPU2 84:00.0/
s/03:00.0/logical_GPU_0 physical_GPU3 03:00.0/
s/44:00.0/logical_GPU_1 physical_GPU4 44:00.0/
s/GPU 3 /logical_GPU_3 physical_GPU1 C4:00.0/
s/GPU 3:/logical_GPU_3 physical_GPU1 C4:00.0/
s/GPU 2 /logical_GPU_2 physical_GPU2 84:00.0/
s/GPU 2:/logical_GPU_2 physical_GPU2 84:00.0/
s/GPU 0 /logical_GPU_0 physical_GPU3 03:00.0/
s/GPU 0:/logical_GPU_0 physical_GPU3 03:00.0/
s/GPU 1 /logical_GPU_1 physical_GPU4 44:00.0/
s/GPU 1:/logical_GPU_1 physical_GPU4 44:00.0/
