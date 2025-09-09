import numpy as np
import pandas as pd


daily_returns = np.array([1.5, -2.1, 3.4, -1.8, 5.0, -0.5, 2.3, -4.1, 1.2, 0.8,
                        -0.9, 2.5, -1.5, 4.0, -3.2, 1.0, -2.8, 3.1, -0.7, 1.9,
                        -2.4, 3.5, -1.1, 2.0, -3.0, 0.5, 2.2, -1.3, 4.5, -2.6])

solana_returns = [2.5, -1.3, 4.2, -0.5, 6.1, -3.8, 1.9, -2.2, 3.0, 0.7]


returns_series = pd.Series(solana_returns)

# 평균 수익률 계산
mean_return = returns_series.mean()

# 표준편차(변동성) 계산
volatility = returns_series.std()

print(f"평균 일일 수익률: {mean_return:.2f}%")
print(f"일일 변동성 (표준편차): {volatility:.2f}%")

# 연간 변동성으로 변환 (거래일 수 365일 가정)
annual_volatility = volatility * np.sqrt(365)
print(f"연간 변동성: {annual_volatility:.2f}%")