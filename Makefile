parKVFinder: dictionaryprocessing.o matrixprocessing.o pdbprocessing.o argparser.o tomlprocessing.o resultsprocessing.o move src/parKVFinder.c
	cc -fopenmp -Isrc -g -o parKVFinder lib/dictionaryprocessing.o lib/matrixprocessing.o lib/pdbprocessing.o lib/argparser.o lib/tomlprocessing.o lib/resultsprocessing.o src/parKVFinder.c -lm

matrixprocessing.o: src/matrixprocessing.c src/matrixprocessing.h
	cc -fopenmp -O3 -Isrc -c src/matrixprocessing.c -lm -static

dictionaryprocessing.o: src/dictionaryprocessing.c src/dictionaryprocessing.h
	cc -Isrc -c src/dictionaryprocessing.c

pdbprocessing.o: src/pdbprocessing.c src/pdbprocessing.h
	cc -Isrc -c src/pdbprocessing.c

argparser.o: src/argparser.c src/argparser.h
	cc -Isrc -c src/argparser.c

tomlprocessing.o: src/tomlprocessing.c src/tomlprocessing.h
	cc -Isrc -c src/tomlprocessing.c

resultsprocessing.o: src/resultsprocessing.c src/resultsprocessing.h
	cc -Isrc -c src/resultsprocessing.c

move: dictionaryprocessing.o matrixprocessing.o pdbprocessing.o argparser.o tomlprocessing.o resultsprocessing.o
	mv dictionaryprocessing.o matrixprocessing.o pdbprocessing.o argparser.o tomlprocessing.o resultsprocessing.o lib/

link:
	cd ${BASH_SOURCE[0]%/*}
	sudo ln -s `pwd`/parKVFinder /usr/local/bin/parKVFinder

KVFinder_PATH:
	cd ${BASH_SOURCE[0]%/*}
	@echo >> ~/.bashrc
	@echo "# KVFinder environment variable" >> ~/.bashrc
	@echo export KVFinder_PATH=`pwd` >> ~/.bashrc

clean:
	rm -r lib/matrixprocessing.o lib/dictionaryprocessing.o lib/pdbprocessing.o lib/argparser.o lib/tomlprocessing.o lib/resultsprocessing.o parKVFinder