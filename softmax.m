function output = softmax(x)
column_number = size(x,2);
for index = 1:column_number
    data = x(:,index);
    de_log = exp(data);
    de = sum(de_log);
    nu(:,index) = de_log/de;
end
output = nu;
aaa = 1;