function [score, rating, decision, dti] = rate_customer(income, debt, findeks)
% RATE_CUSTOMER  Rate one applicant from monthly income, monthly debt
% payments and Findeks score (1-1900). Same logic as credit_risk_rating.m.
% Weights and thresholds are illustrative assumptions.

    dti = debt / income;                                   % Debt-to-Income ratio

    dtiScore     = 100 * (0.60 - min(max(dti,0.20),0.60)) / (0.60 - 0.20);
    findeksScore = 100 * (findeks - 1) / (1900 - 1);

    score = 0.50*dtiScore + 0.50*findeksScore;             % composite 0-100

    edges  = [0 50 65 80];                                 % D, C, B, A lower bounds
    labels = {'D','C','B','A'};
    rating = labels{sum(score >= edges)};

    if dti > 0.55 || findeks < 1000                        % hard knock-out rules
        rating = 'D';
    end

    switch rating
        case {'A','B'}, decision = 'Approve';
        case 'C',       decision = 'Manual review';
        otherwise,      decision = 'Reject';
    end
end
