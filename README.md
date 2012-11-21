hot_swap
========

An example for hot code loading in Erlang

how to start
=====

clone the project from github:

		$ git clone https://github.com/jorgegarrido/hot_swap.git

move to the directory project:

		$ cd hot_swap

now compile all source code in 'src' directory:

		$ make compile

testing the first version of our code:
======

let's start our process as daemon in erlang:

		$ make start

now attach to the running process:

		$ to_erl pipes/

in the shell, send a simple message to our process:

		> code_loading ! {request, [], self()}
		.....

and check the response:

		> flush().
		Shell got {ok,swap,<0.??.0>,{ok,0}}
		ok

the response is {ok, swap, <0.??.0>, {ok, 0}}, the last tuple is provided by dummy_module, since 
the function 'function' sends the length for the list given in the request.

making swap
=====

open another terminal and :
now edit the module 'dummy_module' and comment the line '{ok, length(Arg)}' and uncomment
the line '{ok, Arg}', to retrieve the list value instead length of the list

re-compile:

		$ make compile

and make the swap by providing the module name in make command:

		$ make MODULE=dummy_module swap
		swap completed!!

swap is completed!!

testing swap
=====

in the opened shell type again:
	
		> code_loading ! {request, [], self()}
		.....

and check the response:

		> flush().
		Shell got {ok,swap,<0.??.0>,{ok,[]}}
		ok

great, the hot code load works, and the process never was stopped it!!