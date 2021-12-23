(include "../src/global.scm")
(include "../src/string.scm")
(include "../src/token.scm")
(include "../src/lexer.scm")

(import test)

(test '(directive . ".data") (lex-word ".data"))
(test '(label . "label:") (lex-word "label:"))
(test '(location . ":location") (lex-word ":location"))
(test '(instruction . "push") (lex-word "push"))
(test '(number . "0") (lex-word "0"))
(test-error (lex-word ":"))
(test-error (lex-word "?"))
(test-error (lex-word "x0"))
(test-error (lex-word "0x"))

(test '((directive . ".data")) (lex-line ".data"))
(test '((label . "label:")) (lex-line "label:"))
(test '((instruction . "push")) (lex-line "push"))
(test '((instruction . "push")
        (number . "0"))
      (lex-line "push 0"))
(test '((instruction . "push")
        (location . ":location"))
      (lex-line "push :location"))
(test '((instruction . "push")
        (character . "'x'"))
      (lex-line "push 'x'"))
(test '((instruction . "push")
        (string . "\"xyz\""))
      (lex-line "push \"xyz\""))
(test '((label . "label:")
        (instruction . "push"))
      (lex-line "label: push"))
(test '((label . "label:")
        (instruction . "push")
        (number . "0"))
      (lex-line "label: push 0"))
(test '((label . "label:")
        (instruction . "push")
        (number . "0"))
      (lex-line "label: push 0 ; This is a comment."))

(test-exit)
