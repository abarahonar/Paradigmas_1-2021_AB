% Example qa
qa("Stack", [15, 1, 2001], QA).

% Example register
qa("Stack", [15, 1, 2001], QA),
    stackRegister(QA, "Alan", "nala", QA1),
    stackRegister(QA1, "Alan2", "nala2", QA2),
    stackRegister(QA2, "Alan3", "nala3", [_, _, _, U, _, _]).

% Example login
qa("Stack", [15, 1, 2001], QA),
    stackRegister(QA, "Alan", "nala", QA1),
    stackRegister(QA1, "Alan2", "nala2", QA2),
    login(QA2, "Alan2", "nala2", [_, _, ID, _, _, _]).

% Example ask
qa("Stack", [15, 1, 2001], QA),
    stackRegister(QA, "Alan", "nala", QA1),
    stackRegister(QA1, "Alan2", "nala2", QA2),
    login(QA2, "Alan", "nala", QA3),
    ask(QA3, "Como estan todos ustedes?", QA4),
    login(QA4, "Alan2", "nala2", QA5),
    ask(QA5, "Como estan todas ustedes?", QA6),
    login(QA6, "Alan", "nala", QA7),
    ask(QA7, "Hello?", [_, _, _, _, Q, _]).

% Respuesta: [ID, IDPregunta, Username, Respuesta] - Entero X Entero X
qa("Stack", [15, 1, 2001], QA),
    stackRegister(QA, "Alan", "nala", QA1),
    stackRegister(QA1, "Alan2", "nala2", QA2),
    login(QA2, "Alan", "nala", QA3),
    ask(QA3, "Como estan todos ustedes?", QA4),
    login(QA4, "Alan2", "nala2", QA5),
    ask(QA5, "Como estan todas ustedes?", QA6),
    login(QA6, "Alan", "nala", QA7),
    ask(QA7, "Hello?", QA8),
    login(QA8 , "Alan2", "nala2", QA9),
    answer(QA9, 3, "Bien y usted", QA10),
    login(QA10, "Alan", "nala", QA11),
    answer(QA11, 1, "Bien bien gracias", QFINAL).

