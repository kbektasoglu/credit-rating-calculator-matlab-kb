%% Interactive Credit Rating Calculator
% Enter an applicant's data and get a rating and decision.
% Requires rate_customer.m in the same folder.

clc;
income  = input('Monthly net income (TRY): ');
debt    = input('Total monthly debt payments (TRY): ');
findeks = input('Findeks score (1-1900): ');

if income <= 0 || debt < 0 || findeks < 1 || findeks > 1900
    error('Invalid input: check income, debt and Findeks range.');
end

[score, rating, decision, dti] = rate_customer(income, debt, findeks);

fprintf('\n--- Result ---\n');
fprintf('DTI ratio : %.1f%%\n', 100*dti);
fprintf('Score     : %.1f / 100\n', score);
fprintf('Rating    : %s\n', rating);
fprintf('Decision  : %s\n', decision);
