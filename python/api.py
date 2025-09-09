import requests
import pandas as pd

# 업비트 API 엔드포인트 설정 (캔들 데이터 - 분, 일, 주, 월 단위)
url = "https://api.upbit.com/v1/candles/days"

# 요청 파라미터 설정
params = {
    'market': 'KRW-BTC',  # 가져올 코인 시장 (원화-비트코인)
    'count': 200         # 최근 200일치 데이터 요청
}

try:
    # API 요청 보내기
    response = requests.get(url, params=params)
    response.raise_for_status() # HTTP 오류가 발생하면 예외를 발생시킵니다.
    
    # 응답받은 JSON 데이터를 파이썬 딕셔너리로 변환
    data = response.json()
    
    # JSON 데이터를 DataFrame으로 변환
    df = pd.DataFrame(data)
    
    # 필요한 열만 선택하고 컬럼명 변경
    df = df[['candle_date_time_kst', 'opening_price', 'high_price', 'low_price', 'trade_price', 'candle_acc_trade_volume']]
    df.columns = ['Date', 'Open', 'High', 'Low', 'Close', 'Volume']
    
    # 'Date' 열을 날짜/시간 형식으로 변환하고, 최신 데이터가 위로 오도록 정렬
    df['Date'] = pd.to_datetime(df['Date'])
    df.sort_values(by='Date', ascending=True, inplace=True)
    df.reset_index(drop=True, inplace=True)
    
    print("성공적으로 데이터를 가져왔습니다.")
    print(df.head()) # 상위 5개 행 출력
    
except requests.exceptions.RequestException as e:
    print(f"API 요청 오류 발생: {e}")
except Exception as e:
    print(f"데이터 처리 오류 발생: {e}")

    