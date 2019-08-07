function [signal, label] = generate_data(num_date,num_class)
num_each = num_date/num_class;
qpsk_1 = ones(num_each,2);
qpsk_1 = qpsk_1 + randn(num_each,2)*0.6;
qpsk_2 = ones(num_each,2);
qpsk_2(:,1) = qpsk_2(:,1)*(-1);
qpsk_2 = qpsk_2 + randn(num_each,2)*0.6;
qpsk_3 = ones(num_each,2)*(-1);
qpsk_3 = qpsk_3 + randn(num_each,2)*0.6;
qpsk_4 = ones(num_each,2);
qpsk_4(:,2) = qpsk_4(:,2)*(-1);
qpsk_4 = qpsk_4 + randn(num_each,2)*0.6;
figure;
scatter(qpsk_1(:,1),qpsk_1(:,2))
hold on;
scatter(qpsk_2(:,1),qpsk_2(:,2),'r')
hold on;
scatter(qpsk_3(:,1),qpsk_3(:,2),'g')
hold on;
scatter(qpsk_4(:,1),qpsk_4(:,2),'y')
%% label and feature extract
signal = [qpsk_1; qpsk_2];
signal = [signal; qpsk_3];
signal = [signal; qpsk_4];
label = [ones(num_each,1);2*ones(num_each,1);3*ones(num_each,1);4*ones(num_each,1)];
end

