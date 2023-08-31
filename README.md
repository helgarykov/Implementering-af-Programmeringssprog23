# IPS course 

**Literature and Additional Resources**
Main textbook
The course is based on:

`Introduction to Compiler Design`(2nd ed.)
Torben Ægidius Mogensen, Springer 2017.
Available from Academic Books, with a student discount, at the campus bookstore
Known misprints:
Page 42: Change "denotes itself as a nonterminal" to "denotes itself as a terminal" near the top of the page.
Page 57: The last two lines in the reductionj of Nullable(T) should be
  = Nullable(R) ∨ (false ∧ Nullable(T) ∧ false)
  = Nullable(R)
Page 67: In Figure 2.18: In the function parseR, two occurences of tNode('R' should be replaced by nNode('R'.
Page 77: In Figure 2.27: The last three lines of the "reduce p" should read
  let go s = table[top(stack),n] ;
  push(n,stack) ;
  push(s,stack)
instead of

  push(n,stack) ;
  push(s,stack)
      where table[top(stack),n] = go s
as the stack top has to be read before pushing n. Alternatively, just wrap the two pushes in parentheses, so it is clear that the where-clause covers both.
Page 79: In Figure 2.32, the state containing only G should not be marked as a final state (doubly circled).
Page 153, Exercise 6.4: Some negation symbols got lost in the publication process. De Morgan's law should state that !(p||q) is equivalent to (!p)&&(!q).
General programming in F#
The course and G-assigment will use the F# languageLinks to an external site., which you should have learned in the first year of the BSc programme. The official language documentation is decent, but if you have never followed Programmering og problemløsning, and do not have any previous experience with functional programming, you may find the following (slightly outdated) textbook useful:

Functional Programming using F#Links to an external site.
  Michael R. Hansen & Hans Rischel
  Cambridge University Press, May 2013

**For information on installing the current version of F#**, see the separate Software page.

Lexing and parsing with F# tools
We will use the F# tools FsLex and FsYacc for the compiler project. Unfortunately, the official documentationLinks to an external site. for these tools is fairly rudimentary; for a more systematic introduction to using Lex- and Yacc-like tools in OCaml (which is very similar to F#), we recommend the documentation for OCamlLex/OCamlYacc. For a larger worked example, you may also have a look at the F# Lexing and Parsing wikibookLinks to an external site..

RISC-V and RARS
For continuity with the Computersystemer (CompSys) course (from 2022), and since the MIPS architecture is by now effectively obsolete, this year we'll be retargeting the compiler project for the modern RISC-V architecture. However, if you have previously learned MIPS (e.g., from a previous iteration of IPS), the relevant differences in the instruction sets are mostly trivial, as summarized below. Likewise, the RARS simulator is essentially a clone of MARS, and you should find the user interface immediately familiar.

**The unprivileged RISC-V instruction set is officially specified here: riscv-spec-20191213.pdfDownload riscv-spec-20191213.pdf**

An excellent resource for learning both RISC-V and the basics of computer architecture is:

Computer Organization and Design: RISC-V Edition (2nd ed.)Links to an external site.
  David A. Patterson & John L. Hennessy
  Morgan Kaufmann, 2021

(as also used in CompSys). Unfortunately, unlike for MIPS, there are currently (to our knowledge) no free textbooks of comparable quality. However, given the minimal differences between the two architectures, it is perfectly possible to use the corresponding resources for MIPS. Specifically, you can find a comprehensive introduction to MIPS assembly programming and the MARS simulator in the (free) e-book by Charles Kann. A more compact presentation can be found in the book by Robert BrittonLinks to an external site. (esp. chapters 1–3 and 5–6), and there is also an even shorter video introduction:
ISA 1.2 MIPS Instructions
.

Finally, for some general thoughts on the evolution of computer architectures, you may want to watch the ACM Turing Award Lecture by Hennessy and Patterson.

The IPS-relevant differences between the user-level MIPS32 and RISC-V (RV32IM subset) ISAs are as follows:

A couple of the assembler mnemonics are changed, most notably MOVE → MV and SYSCALL → ECALL. Also, numeric registers are referenced as x7 rather than $7 in the assembler syntax.
Branch offsets are only 12 bits (like register offsets for load/store). Since the Fasto code generator only uses symbolic labels as branch targets, this should be largely invisible, except that conditionals or loops with large bodies (thousands of instructions) might now result in error messages from the RARS assembler.
Immediate arguments to arithmetic/logic operations are also only 12 bits (always sign-extended) vs. MIPS's 16.  Since Fasto doesn't involve any half-word (16 bits) operations, this again shouldn't cause any issues. (The LUI instruction now takes a 20-bits immediate, but since we'll be using the more general LI pseudo-instruction, this also doesn't matter.)
Conditional branches can now directly compare any two registers for inequalities (<, ≤, etc.), not only for equality (= and ≠) and against 0 (≥0 and <0). (But the SLT instruction is still available.)
The standard register-usage conventions are substantially changed: the default return address register is x1 (vs $31); the stack pointer is x2 (vs. $29); function parameters are passed in registers x10–x17 (vs $4–$7); and function results are placed in x10 (vs $2). The division into caller/callee-save registers is also somewhat different.
The RARS environment calls use the same numbers as the MARS syscalls, but different registers: the call number is put in x17, and any parameters are in the standard argument registers (x10 and up).
The DIV/REM instructions don't trap on division/remainder by zero but return nonsensical answers instead. Also, ADD/SUB don't trap on overflow (which MIPS actually does).
There are no branch delay slots, a somewhat obscure MIPS (mis)feature that was simply ignored in MARS by default.
Additional recommended readings
Basics of Compiler Design.
T. Æ. Mogensen, self-published 2000-2010.
In particular chapters 11-13 are relevant in addition to the main course textbook.
The full text of the book, incl. errata, and solutions to selected exercises are available on the book homepage.
Torben Mogensen also wrote some short handouts in Danish which can be useful:

Notes on calculation of FOLLOW sets:  follow.pdfDownload follow.pdf
     Torben Mogensen, 2007. Kort note om beregning af FOLLOW mængder.

Parsing example: example.pdfDownload example.pdf
   T. Æ. Mogensen, 2002. Eksempel på brug af MosML-lex og MosML-yacc.
   BUG: should be re-written to use F# tools.

Chomsky-hierarkiet af sprogklasser: chomsky.pdfDownload chomsky.pdf
Torben Mogensen, 2001. Beskriver udtryksstyrken af regulære og
kontekstfri sprog, og sætter dem ind i et hierarki af sprogklasser.
Further readings
The following textbooks are recommended for further self-study:

Modern Compiler Implementation inb ML.
Andrew W. Appel, Cambridge University Press, 1998. Previously used in the course "Advanced Language Processing" at DIKU.
 
Compilers, Principles, Techiques, and Tools. (the "Dragon Book")
A. V. Aho, M. S. Lam, R. Sethi, and J. D. Ullman, Addison Wesley, 2006 (2nd edition). Classical and famous standard book with a long history.
 
Optimizing Compilers for Modern Architectures.
Randy Allen and Ken Kennedy, Morgan Kaufmann, 2001. This book's focus is optimising and parallelising compilation.