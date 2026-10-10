%% Accuracy vs. Stability

% Define a range of step sizes
step_sizes = logspace(-2, 0, 100); % Vary step sizes logarithmically from 0.01 to 1

% Initialize arrays to store accuracy and stability values
accuracy  = zeros(size(step_sizes));
stability = zeros(size(step_sizes));

% Loop through each step size and calculate accuracy and stability
for i = 1:length(step_sizes)

    step_size = step_sizes(i);
    
    % Calculate accuracy (for demonstration purposes, this is a placeholder)
    % In practice, you would calculate accuracy based on your specific problem.
    accuracy(i) = 1 / step_size; % Placeholder; replace with actual accuracy calculation
    
    % Check for stability based on a threshold (e.g., a CFL condition)
    if step_size <= 0.5 % Adjust the threshold as needed
        stability(i) = 1; % Stable
    else
        stability(i) = 0; % Unstable
    end
    
end

% Create a figure
figure;

% Plot accuracy vs. step size (left y-axis)
yyaxis left;
semilogx(step_sizes, accuracy, 'b-', 'LineWidth', 2);
xlabel('Step Size');
ylabel('Accuracy');
title('Stability vs. Accuracy Trade-off');
grid on;

% Plot stability (binary) vs. step size (right y-axis)
yyaxis right;
plot(step_sizes, stability, 'r-', 'LineWidth', 2);
ylabel('Stability');
ylim([-0.1, 1.1]);

% Add a legend
legend('Accuracy', 'Stability');

% Adjust the figure size and appearance as needed
