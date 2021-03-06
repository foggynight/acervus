(include "../../src/string.scm")

(import test)

(test #f (string-alphabetic? ""))
(test #t (string-alphabetic? "x"))
(test #t (string-alphabetic? "xyz"))
(test #f (string-alphabetic? "0"))
(test #f (string-alphabetic? "0xyz"))
(test #f (string-alphabetic? "xyz0"))
(test #f (string-alphabetic? " "))
(test #f (string-alphabetic? " x"))
(test #f (string-alphabetic? "x "))
(test #f (string-alphabetic? "x y z"))

(test #f (string-numeric? ""))
(test #t (string-numeric? "0"))
(test #t (string-numeric? "000"))
(test #t (string-numeric? "123"))
(test #f (string-numeric? "."))
(test #t (string-numeric? "0."))
(test #t (string-numeric? ".0"))
(test #t (string-numeric? "0.0"))
(test #f (string-numeric? "x"))
(test #f (string-numeric? "0xyz"))
(test #f (string-numeric? "xyz0"))
(test #f (string-numeric? " "))
(test #f (string-numeric? " 0"))
(test #f (string-numeric? "0 "))
(test #f (string-numeric? "1 2 3"))
(test #f (string-numeric? " 0.0"))
(test #f (string-numeric? "0.0 "))
(test #f (string-numeric? "0 .0"))
(test #f (string-numeric? "0. 0"))
(test #f (string-numeric? " 0.0 "))
(test #f (string-numeric? "x."))
(test #f (string-numeric? ".x"))
(test #f (string-numeric? "x.0"))
(test #f (string-numeric? "0.x"))

(test #f (first-char ""))
(test #\x (first-char "xyz"))

(test #f (last-char ""))
(test #\z (last-char "xyz"))

(test #f (find-char #\x ""))
(test #f (find-char #\w "xyz"))
(test 0 (find-char #\x "xyz"))
(test 1 (find-char #\y "xyz"))
(test 2 (find-char #\z "xyz"))
(test 2 (find-char #\y "xxyyzz"))
(test 1 (find-char #\y "xyz" 1))
(test 2 (find-char #\y "xxyyzz" 1))
(test #f (find-char #\x "xyz" 1))
(test #f (find-char #\x "xyz" 3))

(test #f (find-whitespace ""))
(test #f (find-whitespace "xyz"))
(test 0 (find-whitespace " "))
(test 0 (find-whitespace "  "))
(test 0 (find-whitespace "\t"))
(test 0 (find-whitespace "\n"))
(test 0 (find-whitespace " xyz"))
(test 1 (find-whitespace "x yz"))
(test 2 (find-whitespace "xy z"))
(test 3 (find-whitespace "xyz "))
(test 1 (find-whitespace "x\ny\nz"))
(test 1 (find-whitespace "x y z" 1))
(test 3 (find-whitespace "x y z" 2))
(test #f (find-whitespace "xyz" 1))
(test #f (find-whitespace "xyz" 3))

(test #f (find-non-whitespace ""))
(test #f (find-non-whitespace " "))
(test #f (find-non-whitespace "  "))
(test #f (find-non-whitespace "\t"))
(test #f (find-non-whitespace "\n"))
(test 0 (find-non-whitespace "xyz"))
(test 1 (find-non-whitespace " xyz"))
(test 0 (find-non-whitespace "x yz"))
(test 0 (find-non-whitespace "xy z"))
(test 0 (find-non-whitespace "xyz "))
(test 1 (find-non-whitespace "\nx\ny\nz"))
(test 0 (find-non-whitespace "x y z" 0))
(test 2 (find-non-whitespace "x y z" 1))
(test #f (find-non-whitespace "xyz" 3))
(test #f (find-non-whitespace "xyz" 3))

(test #f (next-word ""))
(test #f (next-word " "))
(test #f (next-word "\t"))
(test #f (next-word "\n"))
(test "xyz" (next-word "xyz"))
(test "x" (next-word "x y z"))
(test "x" (next-word "x\ny\nz"))
(test "x" (next-word "\nx\ny\nz"))
(test "xyz" (next-word "\nxyz"))
(test "yz" (next-word "xyz" 1))
(test "abc" (next-word "abc xyz" 0))
(test "xyz" (next-word "abc xyz" 3))
(test "xyz" (next-word "abc xyz" 4))
(test "xyz" (next-word " xyz"))
(test "xyz" (next-word "  xyz"))
(test "xyz" (next-word "  xyz  "))
(test "xyz" (next-word "  abc  xyz  " 5))

(test-exit)
