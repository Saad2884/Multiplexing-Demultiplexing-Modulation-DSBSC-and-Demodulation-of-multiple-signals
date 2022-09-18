close all
fs=150e6;
t=0:1/fs:0.01;
fft_length=512;
f=linspace(-fs/2,fs/2,fft_length);
 
% MESSAGE SIGNALS
 
tmt1=1*cos(2*pi*10000*t);
fmt1=abs(fftshift(fft(tmt1,fft_length)));
subplot(521)
Tplot(t,tmt1,'Message Signal 1')
subplot(522)
Fplot(f,fmt1,'Message Signal 1')
 
tmt2=2*cos(2*pi*20000*t);
fmt2=abs(fftshift(fft(tmt2,fft_length)));
subplot(523)
Tplot(t,tmt2,'Message Signal 2')
subplot(524)
Fplot(f,fmt2,'Message Signal 2')
 
tmt3=3*cos(2*pi*30000*t);
fmt3=abs(fftshift(fft(tmt3,fft_length)));
subplot(525)
Tplot(t,tmt3,'Message Signal 3')
subplot(526)
Fplot(f,fmt3,'Message Signal 3')
 
tmt4=4*cos(2*pi*40000*t);
fmt4=abs(fftshift(fft(tmt4,fft_length)));
subplot(527)
Tplot(t,tmt4,'Message Signal 4')
subplot(528)
Fplot(f,fmt4,'Message Signal 4')
 
tmt5=5*cos(2*pi*50000*t);
fmt5=abs(fftshift(fft(tmt5,fft_length)));
subplot(529)
Tplot(t,tmt5,'Message Signal 5')
subplot(5,2,10)
Fplot(f,fmt5,'Message Signal 5')
 
% CARRIER SIGNALS
 
fc1=32e6;
fc2=34e6;
fc3=36e6;
fc4=38e6;
fc5=40e6;
ct1=1*cos(2*pi*fc1*t);
ct2=2*cos(2*pi*fc2*t);
ct3=3*cos(2*pi*fc3*t);
ct4=4*cos(2*pi*fc4*t);
ct5=5*cos(2*pi*fc5*t);
 
% DSBSC MODULATION
 
figure
 
tdsbsc1=tmt1.*ct1;
fdsbsc1=abs(fftshift(fft(tdsbsc1,fft_length)));
subplot(521)
Tplot(t,tdsbsc1,'Modulated Signal 1')
subplot(522)
Fplot(f,fdsbsc1,'Modulated Signal 1')
 
tdsbsc2=tmt2.*ct2;
fdsbsc2=abs(fftshift(fft(tdsbsc2,fft_length)));
subplot(523)
Tplot(t,tdsbsc2,'Modulated Signal 2')
subplot(524)
Fplot(f,fdsbsc2,'Modulated Signal 2')
 
tdsbsc3=tmt3.*ct3;
fdsbsc3=abs(fftshift(fft(tdsbsc3,fft_length)));
subplot(525)
Tplot(t,tdsbsc3,'Modulated Signal 3')
subplot(526)
Fplot(f,fdsbsc3,'Modulated Signal 3')
 
tdsbsc4=tmt4.*ct4;
fdsbsc4=abs(fftshift(fft(tdsbsc4,fft_length)));
subplot(527)
Tplot(t,tdsbsc4,'Modulated Signal 4')
subplot(528)
Fplot(f,fdsbsc4,'Modulated Signal 4')
 
tdsbsc5=tmt5.*ct5;
fdsbsc5=abs(fftshift(fft(tdsbsc5,fft_length)));
subplot(529)
Tplot(t,tdsbsc5,'Modulated Signal 5')
subplot(5,2,10)
Fplot(f,fdsbsc5,'Modulated Signal 5')
 
% MULTIPLEXING
 
figure
tmux= tdsbsc1+tdsbsc2+tdsbsc3+tdsbsc4+tdsbsc5;
subplot(211)
Tplot(t,tmux, 'Multiplexing ')
fmux=abs(fftshift(fft(tmux,fft_length)));
subplot(212)
Fplot(f,fmux,'Multiplexing ')
 
% DEMULTIPLEXING SIGNAL 1
 
figure
 
Wn1=[(2/fs)*31.9e6 (2/fs)*32.1e6];
B1=fir1(100,Wn1,'bandpass');
tz1=filter(B1,1,tmux);
subplot(321)
Tplot(t,tz1,'Demultiplexed modulated signal 1')
fz1=abs(fftshift(fft(tz1,fft_length)));
subplot(322)
Fplot(f,fz1,'Demultiplexed modulated signal 1')
 
% DEMODULATING SIGNAL 1
 
tDEM1=tz1.*ct1;
fDEM1=abs(fftshift(fft(tDEM1,fft_length)));
subplot(323)
Tplot(t,tDEM1,'Demodulated signal 1')
subplot(324)
Fplot(f,fDEM1,'Demodulated signal 1')
 
f_cut1=20e3;
demWn1=(2/fs)*f_cut1;
demB1=fir1(100,demWn1,'low');
demtz1=filter(demB1,1,tDEM1);
subplot(325)
Tplot(t,demtz1,'Signal 1 after Low Pass Filter')
demfz1=abs(fftshift(fft(demtz1,fft_length)));
subplot(326)
Fplot(f,demfz1,'Signal 1 after Low Pass Filter')
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% DEMULTIPLEXING SIGNAL 2
 
figure
 
Wn2=[(2/fs)*33.9e6 (2/fs)*34.1e6];
B2=fir1(100,Wn2,'bandpass');
tz2=filter(B2,1,tmux);
subplot(321)
Tplot(t,tz2,'Demultiplexed modulated signal 2')
fz2=abs(fftshift(fft(tz2,fft_length)));
subplot(322)
Fplot(f,fz2,'Demultiplexed modulated signal 2')
 
% DEMODULATING SIGNAL 2
 
tDEM2=tz2.*ct2/2;
fDEM2=abs(fftshift(fft(tDEM2,fft_length)));
subplot(323)
Tplot(t,tDEM2,'Demodulated signal 2')
subplot(324)
Fplot(f,fDEM2,'Demodulated signal 2')
 
f_cut2=30e3;
demWn2=(2/fs)*f_cut2;
demB2=fir1(100,demWn2,'low');
demtz2=filter(demB2,1,tDEM2);
subplot(325)
Tplot(t,demtz2,'Signal 2 after Low Pass Filter')
demfz2=abs(fftshift(fft(demtz2,fft_length)));
subplot(326)
Fplot(f,demfz2,'Signal 2 after Low Pass Filter')
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% DEMULTIPLEXING SIGNAL 3
 
figure
 
Wn3=[(2/fs)*35.9e6 (2/fs)*36.1e6];
B3=fir1(100,Wn3,'bandpass');
tz3=filter(B3,1,tmux);
subplot(321)
Tplot(t,tz3,'Demultiplexed modulated signal 3')
fz3=abs(fftshift(fft(tz3,fft_length)));
subplot(322)
Fplot(f,fz3,'Demultiplexed modulated signal 3')
 
% DEMODULATING SIGNAL 3
 
tDEM3=tz3.*ct3/3;
fDEM3=abs(fftshift(fft(tDEM3,fft_length)));
subplot(323)
Tplot(t,tDEM3,'Demodulated signal 3')
subplot(324)
Fplot(f,fDEM3,'Demodulated signal 3')
 
f_cut3=40e3;
demWn3=(2/fs)*f_cut3;
demB3=fir1(100,demWn3,'low');
demtz3=filter(demB3,1,tDEM3);
subplot(325)
Tplot(t,demtz3,'Signal 3 after Low Pass Filter')
demfz3=abs(fftshift(fft(demtz3,fft_length)));
subplot(326)
Fplot(f,demfz3,'Signal 3 after Low Pass Filter')
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% DEMULTIPLEXING SIGNAL 4
 
figure
 
Wn4=[(2/fs)*37.9e6 (2/fs)*38.1e6];
B4=fir1(100,Wn4,'bandpass');
tz4=filter(B4,1,tmux);
subplot(321)
Tplot(t,tz4,'Demultiplexed modulated signal 4')
fz4=abs(fftshift(fft(tz4,fft_length)));
subplot(322)
Fplot(f,fz4,'Demultiplexed modulated signal 4')
 
% DEMODULATING SIGNAL 4
 
tDEM4=tz4.*ct4/4;
fDEM4=abs(fftshift(fft(tDEM4,fft_length)));
subplot(323)
Tplot(t,tDEM4,'Demodulated signal 4')
subplot(324)
Fplot(f,fDEM4,'Demodulated signal 4')
 
f_cut4=50e3;
demWn4=(2/fs)*f_cut4;
demB4=fir1(100,demWn4,'low');
demtz4=filter(demB4,1,tDEM4);
subplot(325)
Tplot(t,demtz4,'Signal 4 after Low Pass Filter')
demfz4=abs(fftshift(fft(demtz4,fft_length)));
subplot(326)
Fplot(f,demfz4,'Signal 4 after Low Pass Filter')
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% DEMULTIPLEXING SIGNAL 5
 
figure
 
Wn5=[(2/fs)*39.9e6 (2/fs)*40.1e6];
B5=fir1(100,Wn5,'bandpass');
tz5=filter(B5,1,tmux);
subplot(321)
Tplot(t,tz5,'Demultiplexed modulated signal 5')
fz5=abs(fftshift(fft(tz5,fft_length)));
subplot(322)
Fplot(f,fz5,'Demultiplexed modulated signal 5')
 
% DEMODULATING SIGNAL 5
 
tDEM5=tz5.*ct5/5;
fDEM5=abs(fftshift(fft(tDEM5,fft_length)));
subplot(323)
Tplot(t,tDEM5,'Demodulated signal 5')
subplot(324)
Fplot(f,fDEM5,'Demodulated signal 5')
 
f_cut5=60e3;
demWn5=(2/fs)*f_cut5;
demB5=fir1(100,demWn5,'low');
demtz5=filter(demB5,1,tDEM5);
subplot(325)
Tplot(t,demtz5,'Signal 5 after Low Pass Filter')
demfz5=abs(fftshift(fft(demtz5,fft_length)));
subplot(326)
Fplot(f,demfz5,'Signal 5 after Low Pass Filter')
