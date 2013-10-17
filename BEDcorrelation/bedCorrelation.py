import numpy as np
import sys

def BuildSignal(A, regionSize=None):
    '''Build signal function based on the matrix, every line (start,end) of the region'''
    if regionSize is None:
        regionSize = A[:, 1].max()
    signal = np.zeros((regionSize,1))
    for line in A:
        signal[line[0]:line[1]] += 1
    return signal 

file1=sys.argv[1]
file2=sys.argv[2]
A = np.loadtxt(file1, usecols=(1,2), skiprows=2)
B = np.loadtxt(file2, usecols=(1,2), skiprows=2)
print 'read done...'
numA = len(A)
numB = len(B)
numMin = min(numA, numB)
if numA > numMin:
    regionSize = A[:,1].max()
    tmpSample = random.sample(xrange(len(A)), numMin)
    tmp1 = BuildSignal(tmpSample, regionSize)
    tmpSample = random.sample(xrange(len(A)), numMin)
    tmp2 = BuildSignal(tmpSample, regionSize)
    tmpSample = random.sample(xrange(len(A)), numMin)
    tmp3 = BuildSignal(tmpSample, regionSize)
    signalA = (tmp1 + tmp2 + tmp3) / 3.
else:
    signalA = BuildSignal(A)
if numB > numMin:
    regionSize = B[:,1].max()
    tmpSample = random.sample(xrange(len(B)), numMin)
    tmp1 = BuildSignal(tmpSample, regionSize)
    tmpSample = random.sample(xrange(len(B)), numMin)
    tmp2 = BuildSignal(tmpSample, regionSize)
    tmpSample = random.sample(xrange(len(B)), numMin)
    tmp3 = BuildSignal(tmpSample, regionSize)
    signalA = (tmp1 + tmp2 + tmp3) / 3.
else:
    signalB = BuildSignal(B)
