noam_emg = readmatrix('noam emg.xlsx');
emg_flexor = noam_emg(:,1);
emg_ext = noam_emg(:,2);
abs_flexor = abs(emg_flexor);
abs_ext = abs(emg_ext);
fs_net = 5;
fs = 1000;
t_flx = 0:1/fs:(length(emg_flexor)-1)/fs;
t_ext= 0:1/fs:(length(emg_ext)-1)/fs;
[b,a] = butter(5,fs_net/(fs/2)/2);
lowpass_fl = filtfilt(b,a,abs_flexor);
lowpass_ext = filtfilt(b,a,abs_ext);

figure(1)
subplot(6,1,1)
plot(t_flx,emg_flexor,'color',rand(1,3));
grid on;
ylabel('EMG [mV]');
xlim([0,197]);
ylim([-1,1]);
legend('BioPac Pro Flexor EMG raw data')

subplot(6,1,2)
plot(t_ext,emg_ext,'color',rand(1,3));
grid on;
ylabel('EMG [mV]');
xlim([0,95]);
ylim([-1,1]);
legend('BioPac Pro EMG Extensor raw data')

subplot(6,1,3)
plot(t_flx,noam_emg(:,3),'color',rand(1,3));
grid on;
ylabel('integrated EMG [mV]');
xlim([0,197]);
ylim([0,0.06]);
legend('BioPac integrated Flexor EMG')

subplot(6,1,4)
plot(t_ext,noam_emg(:,4),'color',rand(1,3));
grid on;
ylabel('integrated EMG [mV]');
xlim([0,95]);
ylim([0,0.07]);
legend('BioPac integrated Extensor EMG')

subplot(6,1,5)
plot(t_flx,lowpass_fl,'color',rand(1,3));
grid on;
ylabel('LPF[mV]');
xlim([0,197]);
ylim([0,0.3]);
legend('LPS for Flexor')

subplot(6,1,6)
plot(t_ext,lowpass_ext,'color',rand(1,3));
grid on;
xlabel('Time [sec]')
ylabel('LPF[mV]');
xlim([0,95]);
ylim([0,0.3]);
legend('LPS for Extensor')