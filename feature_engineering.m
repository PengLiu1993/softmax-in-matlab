function feature = feature_engineering(signal,power)
if(1 == power)
    feature = [ones(size(signal,1),1), signal];
end
if(2 == power)
    x1_2 = signal(:,1).^2;
    x2_2 = signal(:,2).^2;
    x1x2 = signal(:,1).*signal(:,2);
    add_feature = [x1_2,x1x2,x2_2];
    feature = [ones(size(signal,1),1), signal, add_feature];
end
end