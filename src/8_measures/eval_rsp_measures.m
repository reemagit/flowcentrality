addpath('../libs/RSP-betweenness')
edges = dlmread('../../data/networks/PPI_2016_feixiong/processed/PPI_2016_conn_noself_edges_for_matlab.dat');
graph(edges(:,1),edges(:,2))
A = full(adjacency(graph(edges(:,1),edges(:,2))));
%tic;
%rspbet = RSPBC(A,[0.001,0.01,0.1])
%toc;
%dlmwrite('../gendata/measures/rsp.dat',rspbet)

tic;
rspnbet = RSPNBC(A,[0.001,0.01,0.1])
toc;

dlmwrite('../../gendata/measures/rspn.dat',rspnbet)
