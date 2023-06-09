%% read bus data
data_PQ=csvread('C:/Users/31713/Desktop/data_PQ.csv');
[row, col] = size(data_PQ); % 获取矩阵A的行数和列数
%% structure
mpc = struct();
%% MATPOWER Case Format : Version 2
mpc.version = '2';
%%-----  Power Flow Data  -----%%
%% system MVA base
mpc.baseMVA = 100;

%%bus data
%	bus_i	type	Pd	Qd	Gs	Bs	area	Vm	Va	baseKV	zone	Vmax	Vmin
bus_part1 = [
    1	3;
	2	1;
	3	1;
	4	1;
	5	1;
	6	1;
	7	1;
	8	1;
	9	1;
	10	1;
	11	1;
	12	1;
	13	1;
	14	1;
	15	1;
	16	1;
	17	1;
	18	1;
	19	1;
	20	1;
	21	1;
	22	1;
	23	1;
	24	1;
	25	1;
	26	1;
	27	1;
	28	1;
	29	1;
	30	1;
	31	1;
	32	1;
	33	1;
];
bus_part_3 = [
    0	0	1	1	0	12.66	1	1	1;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
    0	0	1	1	0	12.66	1	1.1	0.9;
];

%% generator data
%	bus	Pg	Qg	Qmax	Qmin	Vg	mBase	status	Pmax	Pmin	Pc1	Pc2	Qc1min	Qc1max	Qc2min	Qc2max	ramp_agc	ramp_10	ramp_30	ramp_q	apf
mpc.gen = [
	1	0	0	10	-10	1	100	1	10	0	0	0	0	0	0	0	0	0	0	0	0;
];

%% branch data
%	fbus	tbus	r	x	b	rateA	rateB	rateC	ratio	angle	status	angmin	angmax
mpc.branch = [  %% (r and x specified in ohms here, converted to p.u. below)
	1	2	0.0922	0.0470	0	0	0	0	0	0	1	-360	360;
	2	3	0.4930	0.2511	0	0	0	0	0	0	1	-360	360;
	3	4	0.3660	0.1864	0	0	0	0	0	0	1	-360	360;
	4	5	0.3811	0.1941	0	0	0	0	0	0	1	-360	360;
	5	6	0.8190	0.7070	0	0	0	0	0	0	1	-360	360;
	6	7	0.1872	0.6188	0	0	0	0	0	0	1	-360	360;
	7	8	0.7114	0.2351	0	0	0	0	0	0	1	-360	360;
	8	9	1.0300	0.7400	0	0	0	0	0	0	1	-360	360;
	9	10	1.0440	0.7400	0	0	0	0	0	0	1	-360	360;
	10	11	0.1966	0.0650	0	0	0	0	0	0	1	-360	360;
	11	12	0.3744	0.1238	0	0	0	0	0	0	1	-360	360;
	12	13	1.4680	1.1550	0	0	0	0	0	0	1	-360	360;
	13	14	0.5416	0.7129	0	0	0	0	0	0	1	-360	360;
	14	15	0.5910	0.5260	0	0	0	0	0	0	1	-360	360;
	15	16	0.7463	0.5450	0	0	0	0	0	0	1	-360	360;
	16	17	1.2890	1.7210	0	0	0	0	0	0	1	-360	360;
	17	18	0.7320	0.5740	0	0	0	0	0	0	1	-360	360;
	2	19	0.1640	0.1565	0	0	0	0	0	0	1	-360	360;
	19	20	1.5042	1.3554	0	0	0	0	0	0	1	-360	360;
	20	21	0.4095	0.4784	0	0	0	0	0	0	1	-360	360;
	21	22	0.7089	0.9373	0	0	0	0	0	0	1	-360	360;
	3	23	0.4512	0.3083	0	0	0	0	0	0	1	-360	360;
	23	24	0.8980	0.7091	0	0	0	0	0	0	1	-360	360;
	24	25	0.8960	0.7011	0	0	0	0	0	0	1	-360	360;
	6	26	0.2030	0.1034	0	0	0	0	0	0	1	-360	360;
	26	27	0.2842	0.1447	0	0	0	0	0	0	1	-360	360;
	27	28	1.0590	0.9337	0	0	0	0	0	0	1	-360	360;
	28	29	0.8042	0.7006	0	0	0	0	0	0	1	-360	360;
	29	30	0.5075	0.2585	0	0	0	0	0	0	1	-360	360;
	30	31	0.9744	0.9630	0	0	0	0	0	0	1	-360	360;
	31	32	0.3105	0.3619	0	0	0	0	0	0	1	-360	360;
	32	33	0.3410	0.5302	0	0	0	0	0	0	1	-360	360;
	21	8	2.0000	2.0000	0	0	0	0	0	0	0	-360	360;
	9	15	2.0000	2.0000	0	0	0	0	0	0	0	-360	360;
	12	22	2.0000	2.0000	0	0	0	0	0	0	0	-360	360;
	18	33	0.5000	0.5000	0	0	0	0	0	0	0	-360	360;
	25	29	0.5000	0.5000	0	0	0	0	0	0	0	-360	360;
];

%%-----  OPF Data  -----%%
%% generator cost data
%	1	startup	shutdown	n	x1	y1	...	xn	yn
%	2	startup	shutdown	n	c(n-1)	...	c0
mpc.gencost = [
	2	0	0	3	0	20	0;
];


%%========================================================================%%
%%========================================================================%%
for i = 1:row/33
    data_PQ_part = data_PQ(i:i+32,:)
    bus_combine = [[bus_part1,data_PQ_part,bus_part_3]];
    mpc.bus=bus_combine;
    %% convert branch impedances from Ohms to p.u.
    [PQ, PV, REF, NONE, BUS_I, BUS_TYPE, PD, QD, GS, BS, BUS_AREA, VM, ...
    VA, BASE_KV, ZONE, VMAX, VMIN, LAM_P, LAM_Q, MU_VMAX, MU_VMIN] = idx_bus;
    [F_BUS, T_BUS, BR_R, BR_X, BR_B, RATE_A, RATE_B, RATE_C, ...
    TAP, SHIFT, BR_STATUS, PF, QF, PT, QT, MU_SF, MU_ST, ...
    ANGMIN, ANGMAX, MU_ANGMIN, MU_ANGMAX] = idx_brch;
    Vbase = mpc.bus(1, BASE_KV) * 1e3;      %% in Volts
    Sbase = mpc.baseMVA * 1e6;              %% in VA
    mpc.branch(:, [BR_R BR_X]) = mpc.branch(:, [BR_R BR_X]) / (Vbase^2 / Sbase);
    %% convert loads from kW to MW
    mpc.bus(:, [PD, QD]) = mpc.bus(:, [PD, QD]) / 1e3;


    % flow computing
    result = runpf(mpc);
    % 将result写入文件中,写入的是bus数据
    filename = 'bus33.csv';
    fid = fopen(filename, 'w');
    fprintf(fid, 'bus_i,type,Pd,Qd,Gs,Bs,area,Vm,Va,baseKV,zone,Vmax,Vmin\n');
    for i = 1:size(result.bus, 1)
        fprintf(fid, '%d,%d,%.2f,%.2f,%.2f,%.2f,%d,%.4f,%.4f,%.2f,%d,%.2f,%.2f\n', result.bus(i, :));
    end
    fclose(fid);
end
