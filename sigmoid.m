function h_out = sigmoid(NET)
    h_out = 1./(1+exp(-NET));
end

%reason behind sigmoid curve and it's alternatives like tanh are due to the
%fact that they exist between 0 and 1 (-1 and 1 for tanh) which makes them great for modeling
%probablities. We use the sigmoid in our feed forward network since it
%gives us the probability of a neuron firing given its input.
