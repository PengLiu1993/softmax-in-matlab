%% generate qpsk date
clear all
close all
num_train = 200;
num_class = 4; %% qpsk
power = 1; %% feature
[signal,label] = generate_data(num_train,num_class);
%% change label to vector and matrix form
label_matrix = zeros(num_class,num_train);
for index = 1:num_train
    label_matrix(label(index),index) = 1;
end
% x1_2 = signal(:,1).^2;
% x2_2 = signal(:,2).^2;
% x1x2 = signal(:,1).*signal(:,2);
% add_feature = [x1_2,x1x2,x2_2];
% feature = [ones(num_train,1), signal, add_feature];
feature = feature_engineering(signal,power);
theta = zeros(size(feature,2),num_class);
iteration_number = 1000;
learning_rate = 0.002;
% gradient = zeros(size(feature,2),num_class);
%% find the local optimal choice of theta
for times = 1:iteration_number
    linear = feature*theta;
    activation = softmax(linear);
    loss = 0;
    gradient = zeros(size(feature,2),num_class);
    [loss,gradient] = loss_grad(activation,label_matrix,feature);
%     gradient = gradient/num_train;
    theta = theta + learning_rate.*gradient;
end
% theta = [theta(:,3:4), theta(:,1:2)];
%% the train accuracy
linear = feature*theta;
activation = softmax(linear);
[value,decision] = max(activation,[],2);
diff = find(decision~=label);
error_train = length(diff);
train_accuracy = 1 - error_train/num_train
%% generate test data
num_test = 400;
[signal_test, label_test] = generate_data(num_test,num_class);
feature_test = feature_engineering(signal_test,power);
%  feature_test = [ones(num_test,1),signal_test];
linear_test = feature_test*theta;
activation_test = softmax(linear_test);
[value_test,decision_test] = max(activation_test,[],2);
diff_test = find(decision_test~=label_test);
error_test = length(diff_test);
test_accuracy = 1 - error_test/num_test
aaa = 1;