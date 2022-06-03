import 'package:flutter/foundation.dart';

class Data with ChangeNotifier {
  final List<Questions> _practiceQuestions = [
    Questions(
      correctOption: 1,
      id: 1,
      options: ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
      question:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis in commodo nunc, et consequat ante. Vestibulum ullamcorper enim quis dui volutpat, at aliquet massa bibendum. Pellentesque habitant morbi tristique senectus et netus et malesuada.',
      isCorrect: false,
      isMarkedImp: false,
    ),
    Questions(
      correctOption: 2,
      id: 2,
      options: [
        'Option 1 something',
        'Option 2 something',
        'Option 3 something',
        'Option 4 something'
      ],
      question:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis in commodo nunc, et consequat ante. Vestibulum ullamcorper enim quis dui volutpat, at aliquet massa bibendum. Pellentesque habitant morbi tristique senectus et netus et malesuada.',
      isCorrect: false,
      isMarkedImp: false,
    ),
    Questions(
      correctOption: 1,
      id: 3,
      options: ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
      question:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis in commodo nunc, et consequat ante. Vestibulum ullamcorper enim quis dui volutpat, at aliquet massa bibendum. Pellentesque habitant morbi tristique senectus et netus et malesuada.',
      isCorrect: false,
      isMarkedImp: false,
    ),
    Questions(
      correctOption: 2,
      id: 4,
      options: [
        'Option 1 something',
        'Option 2 something',
        'Option 3 something',
        'Option 4 something'
      ],
      question:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis in commodo nunc, et consequat ante. Vestibulum ullamcorper enim quis dui volutpat, at aliquet massa bibendum. Pellentesque habitant morbi tristique senectus et netus et malesuada.',
      isCorrect: false,
      isMarkedImp: false,
    )
  ];
  List<Questions> get practiceQuestions {
    return [..._practiceQuestions];
  }

  final List<Questions> _testQuestions = [
    Questions(
      correctOption: 1,
      id: 1,
      options: ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
      question:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis in commodo nunc, et consequat ante. Vestibulum ullamcorper enim quis dui volutpat, at aliquet massa bibendum. Pellentesque habitant morbi tristique senectus et netus et malesuada.',
      isCorrect: false,
      isMarkedImp: false,
    ),
    Questions(
      correctOption: 2,
      id: 2,
      options: [
        'Option 1 something',
        'Option 2 something',
        'Option 3 something',
        'Option 4 something'
      ],
      question:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis in commodo nunc, et consequat ante. Vestibulum ullamcorper enim quis dui volutpat, at aliquet massa bibendum. Pellentesque habitant morbi tristique senectus et netus et malesuada.',
      isCorrect: false,
      isMarkedImp: false,
    ),
    Questions(
      correctOption: 1,
      id: 3,
      options: ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
      question:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis in commodo nunc, et consequat ante. Vestibulum ullamcorper enim quis dui volutpat, at aliquet massa bibendum. Pellentesque habitant morbi tristique senectus et netus et malesuada.',
      isCorrect: false,
      isMarkedImp: false,
    ),
    Questions(
      correctOption: 2,
      id: 4,
      options: [
        'Option 1 something',
        'Option 2 something',
        'Option 3 something',
        'Option 4 something'
      ],
      question:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis in commodo nunc, et consequat ante. Vestibulum ullamcorper enim quis dui volutpat, at aliquet massa bibendum. Pellentesque habitant morbi tristique senectus et netus et malesuada.',
      isCorrect: false,
      isMarkedImp: false,
    ),
    Questions(
      correctOption: 4,
      id: 5,
      options: [
        'Option 1 something',
        'Option 2 something',
        'Option 3 something',
        'Option 4 something'
      ],
      question:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis in commodo nunc, et consequat ante. Vestibulum ullamcorper enim quis dui volutpat, at aliquet massa bibendum. Pellentesque habitant morbi tristique senectus et netus et malesuada.',
      isCorrect: false,
      isMarkedImp: false,
    ),
    Questions(
      correctOption: 3,
      id: 6,
      options: [
        'Option 1 something',
        'Option 2 something',
        'Option 3 something',
        'Option 4 something'
      ],
      question:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis in commodo nunc, et consequat ante. Vestibulum ullamcorper enim quis dui volutpat, at aliquet massa bibendum. Pellentesque habitant morbi tristique senectus et netus et malesuada.',
      isCorrect: false,
      isMarkedImp: false,
    )
  ];
  List<Questions> get testQuestions {
    return [..._testQuestions];
  }

  final List<Messages> _messages = [
    Messages(isMe: true, message: 'Message sent by me'),
    Messages(isMe: false, message: 'Message sent by others'),
    Messages(isMe: true, message: 'Message sent by me'),
    Messages(isMe: false, message: 'Message sent by others'),
  ];
  List<Messages> get messages {
    return [..._messages];
  }
}

class Questions {
  final int id;
  final String question;
  final List<String> options;
  final int correctOption;
  final bool isCorrect;
  final bool isMarkedImp;

  Questions({
    required this.correctOption,
    required this.id,
    required this.options,
    required this.question,
    required this.isCorrect,
    required this.isMarkedImp,
  });
}

class Messages {
  final String message;
  final bool isMe;

  Messages({
    required this.isMe,
    required this.message,
  });
}
