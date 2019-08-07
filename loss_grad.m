function [loss, gradient] = loss_grad(activation,label_matrix,feature)
num_train = size(activation,1);
num_class = size(activation,2);
loss = 0;
gradient = zeros(size(feature,2),num_class);
for sample = 1:num_train
    loss = loss - log(activation(sample,:))*label_matrix(:,sample);
    first_part = label_matrix(:,sample).'-activation(sample,:);
    second_part = feature(sample,:);
    gradient = gradient + (second_part).'*first_part;

end    
gradient = gradient/num_train;
aaa = 1;
end