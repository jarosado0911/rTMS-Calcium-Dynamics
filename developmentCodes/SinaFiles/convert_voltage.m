%% Read files
locs = load(['..' filesep '..' filesep 'Results' filesep 'NEURON' filesep 'locs' filesep 'locs_all_seg.txt']);
voltage = load(['..' filesep '..' filesep 'Results' filesep 'NEURON' filesep 'voltage_trace.dat'])';
%% Parse
output_folder = ['..' filesep '..' filesep 'Results' filesep ...
    'Calcium' filesep 'Converted_Voltage_Traces' filesep];
for time_step = 1:size(voltage,2)
    output = [locs(:,1:3) voltage(:,time_step)];
    writematrix(output,[output_folder 'vm_' sprintf('%07d', time_step-1) '.dat'], 'Delimiter', 'space');
end
