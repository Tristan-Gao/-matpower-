% 运行潮流分析并获取结果
casefile = 'case33bw';  % 示例中使用case33系统数据
result = runpf(casefile);

% 将bus数据写入文件中
filename = 'bus33.csv';
fid = fopen(filename, 'w');
fprintf(fid, 'bus_i,type,Pd,Qd,Gs,Bs,area,Vm,Va,baseKV,zone,Vmax,Vmin\n');
for i = 1:size(result.bus, 1)
    fprintf(fid, '%d,%d,%.2f,%.2f,%.2f,%.2f,%d,%.4f,%.4f,%.2f,%d,%.2f,%.2f\n', result.bus(i, :));
end
fclose(fid);

