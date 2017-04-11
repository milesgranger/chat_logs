import pandas as pd
import numpy as np
import torch
import multiprocessing

var = torch.rand((5, 5))
print('CUDA is available!' if torch.cuda.is_available() else 'CUDA is NOT vailable!')
print('Imported numpy and panadas!\n')
print('Number of CPUs: {}'.format(multiprocessing.cpu_count()))

