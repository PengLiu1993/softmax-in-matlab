function [signal, label] = generate_data(num_date,num_class,noise_stand_variance,order)
num_each = num_date/num_class;
qpsk_1 = ones(num_each,2);
qpsk_1 = qpsk_1 + randn(num_each,2)*noise_stand_variance;
qpsk_2 = ones(num_each,2);
qpsk_2(:,1) = qpsk_2(:,1)*(-1);
qpsk_2 = qpsk_2 + randn(num_each,2)*noise_stand_variance;
qpsk_3 = ones(num_each,2)*(-1);
qpsk_3 = qpsk_3 + randn(num_each,2)*noise_stand_variance;
qpsk_4 = ones(num_each,2);
qpsk_4(:,2) = qpsk_4(:,2)*(-1);
qpsk_4 = qpsk_4 + randn(num_each,2)*noise_stand_variance;
figure;
scatter(qpsk_1(:,1),qpsk_1(:,2))
hold on;
scatter(qpsk_2(:,1),qpsk_2(:,2),'r')
hold on;
scatter(qpsk_3(:,1),qpsk_3(:,2),'g')
hold on;
scatter(qpsk_4(:,1),qpsk_4(:,2),'y')
%% label and feature extract
qpsk_1 = wiener_filtering(qpsk_1,noise_stand_variance,order);
qpsk_2 = wiener_filtering(qpsk_2,noise_stand_variance,order);
qpsk_3 = wiener_filtering(qpsk_3,noise_stand_variance,order);
qpsk_4 = wiener_filtering(qpsk_4,noise_stand_variance,order);
signal = [qpsk_1; qpsk_2];
signal = [signal; qpsk_3];
signal = [signal; qpsk_4];
label = [ones(num_each,1);2*ones(num_each,1);3*ones(num_each,1);4*ones(num_each,1)];
end

