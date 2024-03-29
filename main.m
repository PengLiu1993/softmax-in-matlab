%% generate qpsk date
clear all
close all
num_train = 200;
num_class = 4; %% qpsk
power = 1; %% feature
noise_stand_variance = 0.8;
order = 5;
if(order>0)
    [signal,label] = generate_data(num_train,num_class,noise_stand_variance,order);
else
    [signal,label] = generate_data_no_filter(num_train,num_class,noise_stand_variance);
end
%% change label to vector and matrix form
label_matrix = zeros(num_class,num_train);
for index = 1:num_train
    label_matrix(label(index),index) = 1;
end
feature = feature_engineering(signal,power);
theta = zeros(size(feature,2),num_class);
iteration_number = 1000;
learning_rate = 0.002;
%% find the local optimal choice of theta
for times = 1:iteration_number
    linear = feature*theta;
    activation = softmax(linear);
    loss = 0;
    gradient = zeros(size(feature,2),num_class);
    [loss,gradient] = loss_grad(activation,label_matrix,feature);

    theta = theta + learning_rate.*gradient;
end
%% the train accuracy
linear = feature*theta;
activation = softmax(linear);
[value,decision] = max(activation,[],2);
diff = find(decision~=label);
error_train = length(diff);
train_accuracy = 1 - error_train/num_train
%% compare with the original method
label_rec = original_demodu(signal);
diff_ori = find(label_rec~=label);
error_train_ori = length(diff_ori);
train_accuracy_ori = 1 - error_train_ori/num_train
%% generate test data
num_test = 400;
if(order>0)
    [signal_test, label_test] = generate_data(num_test,num_class,noise_stand_variance,order);
else
    [signal_test, label_test] = generate_data_no_filter(num_test,num_class,noise_stand_variance);
end
feature_test = feature_engineering(signal_test,power);
linear_test = feature_test*theta;
activation_test = softmax(linear_test);
[value_test,decision_test] = max(activation_test,[],2);
diff_test = find(decision_test~=label_test);
error_test = length(diff_test);
test_accuracy = 1 - error_test/num_test
%% compare with the original method

label_rec_test = original_demodu(signal_test);
diff_ori_test = find(label_rec_test~=label_test);
error_test_ori = length(diff_ori_test);
test_accuracy_ori = 1 - error_test_ori/num_test
aaa = 1;