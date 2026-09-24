# Credit Risk Rating Calculator (MATLAB)

Interactive rule-based credit rating tool. Enter an applicant's monthly income, monthly debt payments and Findeks score, and get a rating (A-D) and a decision.

## How it works
1. Compute DTI = monthly debt payments / monthly income.
2. Convert each factor to a 0-100 sub-score (DTI: 100 at <=0.20, 0 at >=0.60; Findeks: rescaled from 1-1900).
3. Combine with weights (50/50) into a composite score.
4. Map the score to a rating with cut-offs (A >= 80, B >= 65, C >= 50, otherwise D).
5. Apply hard knock-out rules (DTI > 0.55 or Findeks < 1000 -> D).
6. Map ratings to decisions: A/B = Approve, C = Manual review, D = Reject.

## Files
- `credit_rating_calculator.m` - interactive script: asks for the inputs and prints the result.
- `rate_customer.m` - scoring function used by the calculator.

## Run
Put both files in one folder, open MATLAB and run `credit_rating_calculator.m`.

## Example
Income 60,000 TRY, debt 15,000 TRY, Findeks 1600 -> DTI 25%, score 85.9, rating A, Approve.

This is a very first project of min and not made for any work.
