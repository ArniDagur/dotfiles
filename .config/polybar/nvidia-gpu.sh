#!/bin/sh
nvidia-smi --query-gpu=utilization.gpu,memory.used,memory.total --format=csv,noheader,nounits -l 1 | python ~/.config/polybar/nvidia-fmt.py
