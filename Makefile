
PIPES=pipes
LOGS=log
SNAME=hotswap
COOKIE=swap
HOSTNAME=$(shell hostname -s)

all: compile

compile:
	@mkdir -p ebin
	erlc -o ebin src/*.erl
	
clean:
	@rm -rf $(PIPES)
	@rm -rf $(LOGS)
	@rm -rf ebin/*

start:
	@mkdir -p $(PIPES)
	@mkdir -p $(LOGS)
	run_erl -daemon $(PIPES)/ $(LOGS)/ "exec erl -sname $(SNAME) -setcookie $(COOKIE) -pa ebin/ -eval 'code_loading:start().'"

swap:
	@erl -sname swap -setcookie $(COOKIE) -noshell -eval 'rpc:call('$(SNAME)@$(HOSTNAME)', c, l, [$(MODULE)]), io:format("swap completed!!~n").' -s init stop
