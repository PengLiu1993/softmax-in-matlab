function label_rec = original_demodu(signal)
for signal_index = 1:size(signal,1)
    extract_data = signal(signal_index,:);
    token = extract_data>0;
    if(1 == token(1)&& 1 == token(2))
        label_rec(signal_index) = 1;
    else if(0 == token(1)&& 1 == token(2))
            label_rec(signal_index) = 2;
        else if(0 == token(1)&& 0 == token(2))
                label_rec(signal_index) = 3;
            else if(1 == token(1)&& 0 == token(2))
                    label_rec(signal_index) = 4;
                end
            end
        end
    end    
end
label_rec = label_rec.';
end