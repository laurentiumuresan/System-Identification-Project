t=Muresan(:,1);
u=Muresan(:,2);
y1=Muresan(:,3);
y2=Muresan(:,4);
%%
plot(t,u,t,y1)
% 
% 
% dt=t(2)-t(1)
% idx=[45:500];
% 
% data_id=iddata(y2,u,dt)
% data_id2=iddata(y2(idx,1), u(idx,1),dt)

%% OE
m_oe2 = oe(data_id2,[2 2 1])

%validare statistica      
figure; resid(data_id2,m_oe2,10)

%gradul de suprapunere
figure; compare(data_id2,m_oe2)

%functia de transfer
H_oe2=tf(m_oe2.B, m_oe2.F, dt, 'variable', 'z^-1')
H_oe2_c=d2c(H_oe2)

%% ARMAX

m_armax2=armax(data_id2, [2,2,2,1])

%validare statistica
figure; resid(data_id2,m_armax2)

%gradul de suprapunere
figure; compare(data_id2,m_armax2)

%functia de transfer
Harmax2=tf(m_armax2.B,m_armax2.A, dt ,'variable','z^-1')

Harmax2_c=d2c(Harmax2)

%% IV


m_iv2=iv4(data_id2, [2,2,1])

%validare statistica
figure; resid(data_id2,m_iv2)

%gradul de suprapunere
figure; compare(data_id2,m_iv2)

%functia de transfer
H_iv2=tf(m_iv2.B, m_iv2.F, dt, 'variable', 'z^-1')

H_iv2_c=d2c(H_iv2)
%%
dt=t(2)-t(1)
idx=[45:600];

data_id=iddata(y2,u,dt)
data_id2=iddata(y2(idx,1), u(idx,1),dt)

M_n4sid=n4sid(data_id, 1:10);
M_2=pem(data_id2, M_n4sid)

d2c(M_2)

figure; compare(data_id2,M_2)
figure; resid(data_id2,M_2)

H2_n4sid=tf(M_2)
H2_c_n4sid=d2c(H2_n4sid)


