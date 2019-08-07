function sent_signal = wiener_filtering(signal,noise_stand_variance,order)
dimension = size(signal,2);
for index = 1:dimension
    receive = signal(:,index);
    acf_rec = xcorr(receive,receive,'biased');
    acf_rec_pos = acf_rec(length(receive):length(receive)+order-1); %% sigma_yy
    acf_sent_pos = acf_rec_pos;
    acf_sent_pos(1) = acf_sent_pos(1) - noise_stand_variance*noise_stand_variance;  %% sigma_xx, equals to sigma_yx
    sigma_yy = toeplitz(acf_rec_pos);
    sigma_yy_inv = inv(sigma_yy);
    theta = sigma_yy_inv * acf_sent_pos;
    data_length = length(receive);
    for idx = 1:order-1
        extract_data = flip(receive(1:idx));
        extract_data = [extract_data; zeros(order - idx,1)];
        sent_signal(idx,index) = theta.' * extract_data;
    end
    for idx = order:data_length
        extract_data = flip(receive(idx-order+1:idx));
        sent_signal(idx,index) = theta.'*extract_data;
    end
end
end