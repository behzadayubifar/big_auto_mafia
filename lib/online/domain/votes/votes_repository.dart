import 'package:dio/dio.dart';

class VotesRepository {
  final Dio dio;

  VotesRepository({required this.dio});

  Future<Either<ErrorResp, VoteResp>> vote({
    required String roomId,
    required String vote,
    required 
  })
}
