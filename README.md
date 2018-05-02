# Neural Data Analysis (via Tensor based techniques)

## Tensor regression/Tensor decomposition (python)

### Workflow: 
1. Load the "SharedData.mat" dataset on MATLAB and run the following scripts in the order highlighted below:

 * [spikeData, stateData] = neuronRaster_acrossSessions(1e-3); (Here, 1e-3 is the binWidth (1ms))
 * convert_spikeStructure_indexable
 * convert_cursorStateStruct_indexable

2. Open the jupyter notebook "Tensor_analysis_gpr" and run the python script (for tensor decomposition and regression) as per requirement.

## Autocorrelation matrix

If we need to do any sort of regression or classification, the assumption being made is that each sample (each trial/time-point) is independent and identically distributed. 

-- It will be useful to see how the neuronal activity (across 96 neurons) correlate across time (for every task). 

### Workflow: 
1. Run this script: 
 
  * autocorrelation_neuronalMatrix: This will evaluate the temporal correlation matrix (for different trial-averaged spike-bins) and plot an autocorrelation function (f(tau)).
