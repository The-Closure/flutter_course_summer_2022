import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_course_summer_2022/bloc/auth_bloc.dart';
import 'package:flutter_course_summer_2022/service/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
 blocTest(
    'emits [MyState] when MyEvent is added',
    build: () => AuthBloc(AuthServiceImpl(client: http.Client())),
    act: (bloc1) {
      bloc1 = bloc1 as AuthBloc;
      bloc1.add(LoginEvent(password: 'admin', username: 'admin'));
    },
    wait: const Duration(milliseconds: 3000),
    expect: () => [isA<LoadingAuth>(), isA<Authenticated>()],
  );
blocTest(
    'emits [MyState] when MyEvent is added',
    build: () => AuthBloc(AuthServiceImpl(client: http.Client())),
    act: (bloc1) {
      bloc1 = bloc1 as AuthBloc;
      bloc1.add(LoginEvent(password: 'admin', username: 'user'));
    },
    wait: const Duration(milliseconds: 3000),
    expect: () => [isA<LoadingAuth>(), isA<FailedAuth>()],
  );
}
