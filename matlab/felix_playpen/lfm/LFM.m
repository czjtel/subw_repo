close all
clear all
tau=50*1e-6; %Duration
Beta=15*1e6;%Bandwidth
Fs=60*1e6;  %Sampling rate
t = -tau + 1/Fs:1/Fs:tau-1/Fs;
%t2 =tau/Fs :-1/Fs: 0;
%t = [t1 t2];
% LFM Chirp signal of duration tau, sweep frequency range Beta
x = chirp(t,0,tau,Beta);
y = [];
for i=1:size(x,2)
    y=[y;x(i) 0];
end


figure
plot(t*1e6,real(x));
title(['LFM Chirp Signal (tau =' num2str(tau*1e6) 'us, Beta =' num2str(Beta/1e6) 'MHz, Fs =' num2str(Fs/1e6) 'MHz)']);
xlim([-60 60]); xlabel('Time (us)'); grid


%x = repmat(x,100,1);%
%y=rot90(x);
%y=x
%y = zeros(1,size(x,2));
save('myFile.mat','y');
dlmwrite('test.txt',y,'precision',4, 'delimiter','\t', 'newline', 'pc'); 
%dlmwrite('test.txt',x,'\t')