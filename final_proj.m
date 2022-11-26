%clearvars;
%clc
%close all;
[x,Fs] = audioread('PRoj.mpeg');
sound(x,Fs);

N = size(x,1);  %N=number of sanples
f = Fs*(0:N-1)*N;
T = 1/Fs;  %T=sampling time of input signal
t = (0:N-1)*T;

Length_audio=length(x);
df=Fs/Length_audio;
frequency_audio=-Fs/2:df:Fs/2-df;

figure
FFT_x=fftshift(fft(x))/length(fft(x));
plot(frequency_audio,abs(FFT_x));
title('FFT of Input Audio');
xlabel('Frequency(Hz)');
ylabel('Amplitude');
disp("FFT of input");
%%

y= filter(Num,1,x);
audiowrite('result.wav',y,Fs);
sound(y,Fs);
disp('Playing sound of output');
Length_audio=length(y);
df=Fs/Length_audio;
frequency_audio=-Fs/2:df:Fs/2-df;

figure
FFT_y=fftshift(fft(y))/length(fft(y));
plot(frequency_audio,abs(FFT_y));
title('FFT of Output Audio');
xlabel('Frequency(Hz)');
ylabel('Amplitude');
disp('Plotting FFT of Output Audio');
%%
figure
stem(t , x);title('Original: Time-domain'); xlabel('time(seconds)');
disp('Original signal in Time-domain');
figure
stem(t,y);title('After processing: Time-domain'); xlabel('time(seconds)');
disp('After processing output signal in Time-domain')
figure
subplot(2,1,1)
stem(t , x);title('Original: Time-domain'); xlabel('time(seconds)');
subplot(2,1,2)
stem(t, y);title('After processing: Time-domain'); xlabel('time(seconds)');
disp('16)Conclusion designed filter has removed the noise signal from the noisy signal to get the output signal which is exactly same as original signal')