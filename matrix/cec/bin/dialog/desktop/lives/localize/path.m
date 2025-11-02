(*mode: wolfram script*)

(* To run a WolframScript math solver script locally with a specific Wolfram kernel path or to localize the kernel path, you can use the `-local` option with `wolframscript` or set the environment variable `WOLFRAMSCRIPT_KERNELPATH`.

Example steps to create and run a localized solver script named `path.m`:

1. Write the script `path.m` with your math solver code:

```wolfram
#!/usr/bin/env wolframscript *)

(* Simple math solver example *)
solveEquation[eq_String] := Module[{expr, solutions},
  expr = ToExpression[eq];
  solutions = Solve[expr];
  If[solutions === {}, "No solution found", solutions]
]

Print["Solutions for x^2 - 5x + 6 == 0:"];
Print[solveEquation["x^2 - 5 x + 6 == 0"]];
(* ```

2. Save and make it executable:

```bash
chmod +x path.m
```

3. To run with a localized kernel path (e.g., on Linux), specify the kernel location explicitly:

```bash
wolframscript -local /usr/local/Wolfram/WolframEngine/14.3/Executables/WolframKernel -file ./path.m
```

Or set the environment variable for persistent kernel path:

```bash
export WOLFRAMSCRIPT_KERNELPATH=/usr/local/Wolfram/WolframEngine/14.3/Executables/WolframKernel
./path.m
```

Doing this ensures `wolframscript` uses the specified local kernel executable rather than default or cloud kernels. This setup is essential when you have multiple Wolfram installations or want to guarantee offline local execution of math solver scripts.[1][2][3][4]

In summary, controlling the kernel path via `-local` or `WOLFRAMSCRIPT_KERNELPATH` enables offline math solving with localized Wolfram scripts. Your `path.m` can contain any solver logic and run fully with the specified local kernel executable.

[1](https://helpful.wiki/wolfram/)
[2](https://support.wolfram.com/47243)
[3](http://xahlee.info/M/WolframScript.html)
[4](https://reference.wolfram.com/language/ref/program/wolframscript.html)
[5](https://crates.io/crates/wolfram-app-discovery/range/%5E0.1.2)
[6](https://reference.wolfram.com/language/workflow/InstallWolframScript.html)
[7](http://fmatrm.if.usp.br/cgi-bin/man/man2html?wolframscript+1)
[8](https://www.btbytes.com/posts/2022-10-15-wolframengine)
[9](https://www.wolfram.com/broadcast/video.php?c=277&disp=list&v=526) *)
