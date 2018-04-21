# Neural Data Analysis (via Tensor based techniques)

## Tensor regression/Tensor decomposition (python)

### Workflow: 
1. Load the "SharedData.mat" dataset on MATLAB and run the following scripts in the order highlighted below:

 * [spikeData, stateData] = neuronRaster_acrossSessions(1e-3); (Here, 1e-3 is the binWidth (1ms))
 * convert_spikeStructure_indexable
 * convert_cursorStateStruct_indexable

2. Open the jupyter notebook "Tensor_analysis_gpr" and run the python script (for tensor decomposition and regression) as per requirement.

