import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Question {
  final String id;
  final String question;
  final List<String> answers;
  final String correctAnswer;
  Question({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  Question copyWith({
    String? id,
    String? question,
    List<String>? answers,
    String? correctAnswer,
  }) {
    return Question(
      id: id ?? this.id,
      question: question ?? this.question,
      answers: answers ?? this.answers,
      correctAnswer: correctAnswer ?? this.correctAnswer,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'question': question});
    result.addAll({'answers': answers});
    result.addAll({'correctAnswer': correctAnswer});

    return result;
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] ?? '',
      question: map['question'] ?? '',
      answers: List<String>.from(map['answers']),
      correctAnswer: map['correctAnswer'] ?? '',
    );
  }
  factory Question.fromQueryDocumentSnapshot(QueryDocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    final id = snapshot.id;
    data['id'] = id;
    return Question.fromMap(data);
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Question(id: $id, question: $question, answers: $answers, correctAnswer: $correctAnswer)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Question &&
        other.id == id &&
        other.question == question &&
        listEquals(other.answers, answers) &&
        other.correctAnswer == correctAnswer;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        question.hashCode ^
        answers.hashCode ^
        correctAnswer.hashCode;
  }
}

// List<Question> question = [
//   Question(
//       id: '1',
//       question: 'What is the question',
//       answers: ['1', '2', '3', '4'],
//       correctAnswer: '3'),
//   Question(
//       id: '2',
//       question: 'What is the apenso',
//       answers: ['1', '2', '3', '4'],
//       correctAnswer: '2'),
//   Question(
//       id: '3',
//       question: 'What is the hahaha',
//       answers: ['1', '2', '3', '4'],
//       correctAnswer: '4'),
//   Question(
//       id: '4',
//       question: 'What is the hrhehs',
//       answers: ['1', '2', '3', '4'],
//       correctAnswer: '1'),
// ];
