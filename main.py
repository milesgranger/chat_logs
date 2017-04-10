import pandas as pd
import numpy as np
import torch

var = torch.rand((5, 5))

if torch.cuda.is_available():
    print('CUDA is available!')
else:
    print('CUDA is NOT vailable!')

print('Imported numpy and panadas!\n')