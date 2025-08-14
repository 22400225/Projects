import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const TimerPage(),
    );
  }
}

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  // dart:async의 Timer 클래스. 주기적인 작업을 수행할 때 사용합니다.
  Timer? _timer;
  // 시간을 측정하기 위한 Stopwatch.
  final Stopwatch _stopwatch = Stopwatch();
  // 화면에 표시될 시간을 저장하는 변수.
  String _displayTime = '00:00:00';

  // 위젯이 화면에서 사라질 때 호출됩니다.
  // Timer가 계속 동작하는 것을 방지하여 메모리 누수를 막습니다.
  @override
  void dispose() {
    _timer?.cancel();
    _stopwatch.stop();
    super.dispose();
  }

  // 시간을 HH:MM:SS 형식으로 변환하는 함수.
  String _formatTime(Duration duration) {
    // padLeft(2, '0')는 문자열이 2자리 미만일 경우 왼쪽에 '0'을 채워줍니다.
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  // 타이머 시작 함수
  void _startTimer() {
    // 이미 타이머가 실행 중이면 아무것도 하지 않습니다.
    if (_timer?.isActive ?? false) {
      return;
    }

    // 스톱워치를 시작합니다.
    _stopwatch.start();

    // 1초마다 반복되는 타이머를 생성합니다.
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // setState를 호출하여 화면을 다시 그리도록 합니다.
      if (_stopwatch.isRunning) {
        setState(() {
          // 스톱워치의 경과 시간을 포맷에 맞춰 업데이트합니다.
          _displayTime = _formatTime(_stopwatch.elapsed);
        });
      }
    });
  }

  // 타이머 중지 함수
  void _stopTimer() {
    // 타이머를 취소하고 스톱워치를 멈춥니다.
    _timer?.cancel();
    _stopwatch.stop();
    // 화면을 업데이트하여 마지막 시간을 표시합니다.
    setState(() {});
  }

  // 타이머 리셋 함수
  void _resetTimer() {
    // 타이머를 멈추고 스톱워치를 리셋합니다.
    _stopTimer();
    _stopwatch.reset();
    // 화면을 초기 상태로 업데이트합니다.
    setState(() {
      _displayTime = '00:00:00';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('간단한 타이머'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_displayTime, style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 30),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(onPressed: _startTimer, child: const Text('시작')),
              const SizedBox(width: 20),
              ElevatedButton(onPressed: _stopTimer, child: const Text('중지')),
              const SizedBox(width: 20),
              ElevatedButton(onPressed: _resetTimer, child: const Text('리셋')),
            ]),
          ],
        ),
      ),
    );
  }
}
